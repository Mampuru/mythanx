
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mythanx/controllers/cart_controller.dart';
import 'package:mythanx/helpers/shared_prefs.dart';
import 'package:mythanx/routing/navigation_service.dart';
import 'package:mythanx/routing/router.dart';
import 'package:mythanx/routing/routes.dart';
import 'package:mythanx/views/auth/sign_in_view.dart';

import 'constants.dart';
import 'controllers/auth_controller.dart';
import 'helpers/locator.dart';

bool hasToken = false;

Future<void> main() async {
  Get.put(AuthController());
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthController authController = Get.put(AuthController());
  final CartController cartController = Get.put(CartController());
  bool hasToken = false;
  bool isLoading = false;

  @override
  void initState() {
    getIsAuth();
    authController.getUserData();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return isLoading ?
        const MaterialApp(
            debugShowCheckedModeBanner: false,
          color: kSecondaryColor,
          home: Scaffold(
            backgroundColor: kSecondaryColor,
            body: Padding(
              padding: EdgeInsets.all(100.0),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  kWhite,
                ),
              ),
            ),
          )
        )
        :
        MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'myThanx',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: hasToken == true ? routeHome : routeSignIn,
          navigatorKey: locator<NavigationService>().navigatorKey,
          onGenerateRoute: generateRoute,
          onUnknownRoute: (settings) {
            return MaterialPageRoute(builder: (_) => const SignInView());
        }
    );
  }

  getIsAuth() async{
    setState(() {
      isLoading = true;
    });
    var temp = await getAuth();
    setState(() {
      hasToken = temp;
      isLoading = false;
    });

  }
}


