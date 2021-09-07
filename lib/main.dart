import 'package:ReggitreApp/pages/root_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      textTheme:
      GoogleFonts.latoTextTheme(),
      primarySwatch: Colors.green,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    locale: Locale('pt', "MZ"),
    debugShowCheckedModeBanner: false,
    home: RootApp(),
  ));
}
