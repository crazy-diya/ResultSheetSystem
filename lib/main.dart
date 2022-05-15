import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:result_sheet_system/features/presentation/views/ar_register/ar_registar.dart';
import 'package:result_sheet_system/features/presentation/views/sign_in/sign_in.dart';
import 'package:result_sheet_system/features/presentation/views/student_register/student_register.dart';
import 'package:result_sheet_system/features/presentation/views/welcome_page/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.playfairDisplayTextTheme(
          Theme.of(context).textTheme,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.yellow, //  <-- light color
          textTheme:
              ButtonTextTheme.primary, //  <-- dark text for light background
        ),
      ),
      home: const SignIn(),
    );
  }
}
