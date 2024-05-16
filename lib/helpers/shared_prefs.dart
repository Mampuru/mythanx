import 'package:mythanx/data/mapper/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> clearAll() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();
}

Future<void> setAuth(bool hasToken) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setBool('authToken', hasToken);
}

Future<bool> getAuth() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? token = prefs.getBool('authToken');
  if(token == null){
    return false;
  }else{
    return token;
  }
}

Future<String?> getAuthToken() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? token = preferences.getString('token');
  return token;
}

Future<void> setAuthToken(String token) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString('token',token);
}

Future<String?> getUserName() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? name = preferences.getString('name');
  return name;
}

Future<void> setUserName(String username) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
   await preferences.setString('name',username);
}


Future<void> setUserDetails(User user) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String stringUser = userToJson(user);
  await preferences.setString('userDetails',stringUser);
}

Future<User> getUserDetails() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? stringUser =  preferences.getString('userDetails');
  User object = userFromJson(stringUser!);
  return object;
}