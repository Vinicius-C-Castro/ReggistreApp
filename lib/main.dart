
import 'package:ReggitreApp/screens/authentication/create-new-account.dart';
import 'package:ReggitreApp/screens/authentication/forgot-password.dart';
import 'package:ReggitreApp/screens/authentication/login-screen.dart';
import 'package:ReggitreApp/screens/menu/screen/HomePage.dart';
import 'package:ReggitreApp/screens/menu/screen/InicialPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';

main() {
  initializeDateFormatting().then((_){
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reggistre',
      theme: ThemeData(
        textTheme:
        GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        'ForgotPassword': (context) => ForgotPassword(),
        'CreateNewAccount': (context) => CreateNewAccount(),
        'InicialPage': (context) => InicialPage(),
        'HomePage': (context) => HomePage(),
      },
    );
  }
}