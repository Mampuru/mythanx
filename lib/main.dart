import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mythanx/views/auth/sign_in_view.dart';
import 'package:mythanx/views/independent_views/home_view.dart';

import 'controllers/auth_controller.dart';

void main() {
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthController authController = Get.put(AuthController());
  bool hasToken;

  @override
  void initState() {
    super.initState();
    hasToken = authController.hasToken.value;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'myThanx',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: hasToken ? const HomeView() : const SignInView() ,
    );
  }
}


