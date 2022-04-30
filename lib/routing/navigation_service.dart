import 'package:flutter/material.dart';

class NavigationService {
  final navigatorKey = GlobalKey<NavigatorState>();
  final controller = PageController();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  Future<dynamic> pushTo(MaterialPageRoute routePage) {
    return navigatorKey.currentState.push(routePage);
  }

  Future<dynamic> pushToAndRemove(MaterialPageRoute routePage) {
    return navigatorKey.currentState.pushAndRemoveUntil(routePage, (route) => false);
  }

  Future<dynamic> navigateToAndRemove(String routeName) {
    return navigatorKey.currentState.pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  void goBack() {
    return navigatorKey.currentState.pop();
  }
}