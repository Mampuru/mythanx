import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mythanx/constants.dart';
import 'package:mythanx/helpers/shared_prefs.dart';
import 'package:mythanx/views/auth/sign_in_view.dart';
import 'package:mythanx/views/independent_views/home_view.dart';

import 'controllers/auth_controller.dart';

// bool hasToken = false;

Future<void> main() async {
  Get.put(AuthController());
  // hasToken = await getAuth();

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
    getIsAuth();
    hasToken = authController.hasToken.value;
    super.initState();
    authController.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'myThanx',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: hasToken == true ? const HomeView() : const SignInView(),
    );
  }

  getIsAuth() async{
    setState(() async {
      hasToken = await getAuth();
    });

  }
}


