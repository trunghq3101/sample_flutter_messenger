import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_flutter_messenger/routes/home_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.spaceMonoTextTheme(textTheme).copyWith(
          headline1: GoogleFonts.spaceMono(
              fontWeight: FontWeight.normal, fontSize: 36, color: Colors.black),
          headline2:
              GoogleFonts.spaceMono(fontWeight: FontWeight.bold, fontSize: 18),
          headline3:
              GoogleFonts.spaceMono(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeRoute(),
    );
  }
}
