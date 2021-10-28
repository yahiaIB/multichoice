import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multichoice/app/constants.dart';
import 'package:multichoice/app/providers.dart';
import 'package:multichoice/app/routes.dart';
import 'package:multichoice/styles/custom_theme.dart';
import 'package:provider/provider.dart';

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // to change navigation bars color to the color of the app
    // SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
    //     systemNavigationBarColor: CustomColors.primaryColor,
    //     systemNavigationBarDividerColor: CustomColors.primaryColor,
    //     statusBarColor: Colors.transparent,
    //     statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
        theme: CustomTheme.lightTheme,
        title: Constants.appTitle,
        darkTheme: CustomTheme.lightTheme,
        initialRoute: Routes.initRoute,
        onGenerateRoute: Routes.generateRoute,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("ar", "AE"), // RTL locales
        ],
        locale: const Locale("ar", "AE"));
  }
}
