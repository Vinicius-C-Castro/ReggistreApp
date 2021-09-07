import 'package:ReggitreApp/pages/authentication/create-new-account.dart';
import 'package:ReggitreApp/pages/authentication/forgot-password.dart';
import 'package:ReggitreApp/pages/authentication/login-screen.dart';
import 'package:ReggitreApp/pages/root_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    title: 'Reggistre',
    theme: ThemeData(
      textTheme:
      GoogleFonts.latoTextTheme(),
      primarySwatch: Colors.indigo,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    locale: Locale('pt', "MZ"),
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => LoginScreen(),
      'ForgotPassword': (context) => ForgotPassword(),
      'CreateNewAccount': (context) => CreateNewAccount(),
      'HomePage': (context) => RootApp(),
    },
  ));
}
