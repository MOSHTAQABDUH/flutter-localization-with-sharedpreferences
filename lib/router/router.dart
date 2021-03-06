import 'package:flutter/material.dart';
import 'package:testlang/pages/about_page.dart';
import 'package:testlang/pages/home_page.dart';
import 'package:testlang/pages/not_found_page.dart';
import 'package:testlang/router/route_constants.dart';

class Router {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => AboutPage());
      default:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  }
}
