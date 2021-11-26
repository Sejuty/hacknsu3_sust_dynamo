import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'const.dart';
import 'screens/Home/home.dart';

//Buffer commit to main
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          button: GoogleFonts.roboto(
            fontSize: 12.0,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w100,
            color: Colors.white,
          ),
          bodyText1: GoogleFonts.roboto(
              fontSize: 12.0,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
              color: textColor.withOpacity(1.0)),
          bodyText2: GoogleFonts.roboto(
              fontSize: 12.0,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
              color: textColor.withOpacity(0.6)),
        ),
        primaryColor: const Color(0xff0077B6),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shadowColor: const Color(0xff0077B6).withOpacity(.9),
            elevation: 10,
            primary: const Color(0xff0077B6),
            padding: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
      home: const BufferWidget(),
    );
  }
}

class BufferWidget extends StatelessWidget {
  const BufferWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenH = MediaQuery.of(context).size.height;
    screenW = MediaQuery.of(context).size.width;
    return const Home();
  }
}