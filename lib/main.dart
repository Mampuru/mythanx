import 'package:flutter/material.dart';
import 'package:mythanx/views/auth/sign_in_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'myThanx',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const SignInView(),
    );
  }
}


