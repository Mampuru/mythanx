
import 'dart:convert';
import 'dart:io';

import 'package:mythanx/data/dto/country_dto.dart';
import 'package:mythanx/data/dto/user_dto.dart';
import 'package:mythanx/data/mapper/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:mythanx/data/mapper/user_profile_model.dart';
import 'package:mythanx/views/widgets/primary_toast.dart';

import '../constants.dart';
import 'api_config.dart';

Future<User> register(UserDto user) async {
  try {
    final http.Response response = await http.post(
      Uri.parse(signUp),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: userDtoToJson(user)
    );

    if (response.statusCode == 201) {
       return userFromJson(response.body);
    } else if (response.statusCode == 401) {
      PrimaryToast().displayToast("Unauthorized", kErrorColor);
      throw Exception('Unauthorized Access: Failed to send location');
    }
  } on SocketException {
    PrimaryToast().displayToast("No Internet connection", kInfoColor);
    throw Exception('No Internet connection');
  }
  return null;
}

Future<User> login(String username,password) async {
  try {
    final http.Response response = await http.post(
        Uri.parse(signIn),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(
            <String, String>{'username': username, 'password': password})
        );
        if (response.statusCode == 200) {
          return userFromJson(response.body);
    } else if (response.statusCode == 401) {
  PrimaryToast().displayToast("Unauthorized", kErrorColor);
  throw Exception('Unauthorized Access: Failed to send location');
  }
  } on SocketException {
  PrimaryToast().displayToast("No Internet connection", kInfoColor);
  throw Exception('No Internet connection');
  }
  return null;
}

Future<UserProfile> getUser(String apiKey) async {
  try {
    final http.Response response = await http.get(
        Uri.parse(signUp),
        headers: <String, String>{
          'Authorization': apiKey,
          'Content-Type': 'application/json; charset=UTF-8'
        });

        if (response.statusCode == 200) {
          return userProfileFromJson(response.body);
    } else if (response.statusCode == 401) {
  PrimaryToast().displayToast("Unauthorized", kErrorColor);
  throw Exception('Unauthorized Access: Failed to send location');
  }
  } on SocketException {
  PrimaryToast().displayToast("No Internet connection", kInfoColor);
  throw Exception('No Internet connection');
  }
  return null;
}

Future<CountryDto> country() async {
  try {
    final http.Response response = await http.get(
        Uri.parse(getCountry),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
    );
    if (response.statusCode == 200) {
      return countryDtoFromJson(response.body);
    } else if (response.statusCode == 401) {
      PrimaryToast().displayToast("Unauthorized", kErrorColor);
      throw Exception('Unauthorized Access: Failed to send location');
    }
  } on SocketException {
    PrimaryToast().displayToast("No Internet connection", kInfoColor);
    throw Exception('No Internet connection');
  }
  return null;
}