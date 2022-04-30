import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mythanx/controllers/auth_controller.dart';
import 'package:mythanx/routing/routes.dart';
import 'package:mythanx/views/auth/sign_in_view.dart';
import 'package:mythanx/views/auth/sign_up_view.dart';
import 'package:mythanx/views/independent_views/edit_profile_view.dart';
import 'package:mythanx/views/independent_views/follow_list_view.dart';
import 'package:mythanx/views/independent_views/home_view.dart';

final AuthController authController = Get.put(AuthController());

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
      case routeSignIn:
        return _getPageRoute(const SignInView(), settings);
      case routeSignUp:
        return _getPageRoute(const SignUpView(), settings);
      case routeHome:
        return _getPageRoute(const HomeView(), settings);
      case routeEditProfile:
        return _getPageRoute(const EditProfileView(), settings);
      case routeFollowList:
        return _getPageRoute(const FollowListView(), settings);
    }
    return null;
  }


PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
    settings: RouteSettings(name: routeName),
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    child,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
  );
}
