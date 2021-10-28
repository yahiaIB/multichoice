import 'package:flutter/material.dart';
import 'package:multichoice/screens/signupScreen/signup_screen.dart';
import 'package:multichoice/screens/splash_screen.dart';

class Routes {
  //TODO Define your routes name, init this routes in material App variable 'routes'
  Routes._();

  //static variables
  static const String initRoute = '/';
  static const String signUp = '/sign_up';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                )
        );
    }
  }

  static final routes = <String, WidgetBuilder>{
    initRoute: (BuildContext context) => SplashScreen(),
    signUp: (BuildContext context) => const SignUpScreen(),
  };
}
