import 'package:multichoice/styles/custom_assets.dart';
import 'package:multichoice/viewmodels/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homeScreen/home_screen.dart';
import 'loginScreen/login_screen.dart';



class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationViewModel>(
        builder: (context, authModel, child) =>
            screen(authModel.status, child ?? Container(),context));
  }

  Widget screen(AppStatus appStatus, Widget child,context) {
    double logoWidth = MediaQuery.of(context).size.width * .2;
    if (appStatus == AppStatus.uninitialized) {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(CustomAssets.background),
              fit: BoxFit.cover
            )
          ),
          child: Center(
            child: Image.asset(
              CustomAssets.logo,
              width: logoWidth,
              height: logoWidth,
            ),
          ),
        ),
      );
    }
    if (appStatus == AppStatus.unauthenticated) {
      return const LoginScreen();
    }
    if (appStatus == AppStatus.authenticated) {
      return const HomeScreen();
    }
    return Scaffold(
      body: Center(
        child: Image.asset(
          CustomAssets.logo,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
