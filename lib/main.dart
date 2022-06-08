import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:result_sheet_system/features/presentation/views/admin_panel/student_list/student_list.dart';
import 'package:result_sheet_system/features/presentation/views/sign_in/sign_in.dart';
import 'package:result_sheet_system/features/presentation/views/welcome_page/welcome_page.dart';

import 'features/presentation/views/admin_panel/admin_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const firebaseConfig = {
    "apiKey": "AIzaSyBkpe8PE3nZY4dxzSjblmeO8JPAjuuHHZI",
    "authDomain": "resultsheetsystem-825ed.firebaseapp.com",
    "projectId": "resultsheetsystem-825ed",
    "storageBucket": "resultsheetsystem-825ed.appspot.com",
    "messagingSenderId": "937607523491",
    "appId": "1:937607523491:web:b1d97eae184be691322316",
    "measurementId": "G-MM7SJPBB72"
  };
  FirebaseApp app = await Firebase.initializeApp(
      options: FirebaseOptions.fromMap(firebaseConfig));
  debugPrint(app.name.toString());
  // debugPrint(FirebaseAuth.instance.currentUser!.email.toString());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
        routes: {
          AdminHome.id: (context) => const AdminHome(),
          "11": (context) => const StudentList(
                year: "First Year",
                semester: "First Semester",
              ),
          "12": (context) => const StudentList(
                year: "First Year",
                semester: "Second Semester",
              ),
          "21": (context) => const StudentList(
                year: "Second Year",
                semester: "First Semester",
              ),
          "22": (context) => const StudentList(
                year: "Second Year",
                semester: "Second Semester",
              ),
          "31": (context) => const StudentList(
                year: "Third Year",
                semester: "First Semester",
              ),
          "32": (context) => const StudentList(
                year: "Third Year",
                semester: "Second Semester",
              ),
          "41": (context) => const StudentList(
                year: "Fourth Year",
                semester: "First Semester",
              ),
          "42": (context) => const StudentList(
                year: "Fourth Year",
                semester: "Second Semester",
              ),
        },
        home: FirebaseAuth.instance.currentUser != null
            ? const AdminHome()
            : const WelcomePage());
  }
}
