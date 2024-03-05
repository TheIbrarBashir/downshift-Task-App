import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData get appTheme => ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      textTheme: GoogleFonts.poppinsTextTheme(
        const TextTheme(
          titleMedium: TextStyle(color: Colors.black, fontSize: 14.0),
          headlineSmall: TextStyle(
              color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w400),
        ),
      ),
    );
