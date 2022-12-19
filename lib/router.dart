import 'package:flutter/material.dart';
import 'package:llunkei_test_app/common/widgets/bottom_bar.dart';

import 'package:llunkei_test_app/features/auth/screens/auth_screen.dart';
import 'package:llunkei_test_app/features/home/screens/home_screen.dart';

// routeSettings will give us the necesarry data to construct the routes, really similar to the concept of props
Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    default: //the "else", for whenever we get a route that does not match any of the switch cases
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
