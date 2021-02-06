import 'package:flutter/material.dart';
import 'package:flutter_hackathon_21/core/components/page/page_not_found.dart';
import 'package:flutter_hackathon_21/core/constants/navigation/navigation_constants.dart';
import 'package:flutter_hackathon_21/view/home/view/home_page.dart';


class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.HOME_PAGE:
        return _normalNavigate(HomePage());
      default:
        return _normalNavigate(PageNotFound());
    }
  }

  MaterialPageRoute _normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
