import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:result_sheet_system/core/utils/app_colors.dart';
import 'package:result_sheet_system/features/data/datasources/dataSources.dart';
import 'package:result_sheet_system/features/presentation/views/admin_panel/student_list/student_list.dart';
import 'package:result_sheet_system/features/presentation/views/sign_in/sign_in.dart';
import 'package:result_sheet_system/features/presentation/views/student_panel/add_subjects/add_subjects.dart';
import 'package:result_sheet_system/features/presentation/views/student_panel/check_results/check_results.dart';

class StudentHome extends StatefulWidget {
  static const String id = "admin_home";

  const StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  bool fillSubjects11 = false;
  bool fillSubjects12 = false;
  bool fillSubjects21 = false;
  bool fillSubjects22 = false;
  bool fillSubjects31 = false;
  bool fillSubjects32 = false;
  bool fillSubjects41 = false;
  bool fillSubjects42 = false;

  bool fillSubject = true;

  Widget _selectedScreen = const Center(
    child: Text("Go and Find!"),
  );

  currentScreen(item) async {
    switch (item.route) {
      case "11":
        setState(() {
          _selectedScreen = fillSubjects11 == true
              ? CheckResults(year: "First Year", semester: "First Semester")
              : AddSubjects(year: "First Year", semester: "First Semester");
        });
        break;
      case "12":
        setState(() {
          _selectedScreen = fillSubjects12 == true
              ? CheckResults(year: "First Year", semester: "Second Semester")
              : AddSubjects(year: "First Year", semester: "Second Semester");
        });
        break;
      case "21":
        setState(() {
          _selectedScreen = fillSubjects21 == true
              ? CheckResults(year: "Second Year", semester: "First Semester")
              : AddSubjects(year: "Second Year", semester: "First Semester");
        });
        break;
      case "22":
        setState(() {
          _selectedScreen = fillSubjects22 == true
              ? CheckResults(year: "Second Year", semester: "Second Semester")
              : AddSubjects(year: "Second Year", semester: "Second Semester");
        });
        break;
      case "31":
        setState(() {
          _selectedScreen = fillSubjects31 == true
              ? CheckResults(year: "Third Year", semester: "First Semester")
              : AddSubjects(year: "Third Year", semester: "First Semester");
        });
        break;
      case "32":
        setState(() {
          _selectedScreen = fillSubjects32 == true
              ? CheckResults(year: "Third Year", semester: "Second Semester")
              : AddSubjects(year: "Third Year", semester: "Second Semester");
        });
        break;
      case "41":
        setState(() {
          _selectedScreen = fillSubjects41 == true
              ? CheckResults(year: "Fourth Year", semester: "First Semester")
              : AddSubjects(year: "Fourth Year", semester: "First Semester");
        });
        break;
      case "42":
        setState(() {
          _selectedScreen = fillSubjects42 == true
              ? CheckResults(year: "Fourth Year", semester: "Second Semester")
              : AddSubjects(year: "Fourth Year", semester: "Second Semester");
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('STUDENT PANEL'),
        titleTextStyle: GoogleFonts.playfairDisplay(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.wSecondaryColor,
        ),
        centerTitle: true,
        actions: [
          Container(
            padding: EdgeInsets.only(right: 30),
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      "assets/icons/bx-message.svg",
                      width: 20,
                      height: 20,
                      color: AppColors.wSecondaryColor,
                    )),
                InkWell(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignIn(),
                      ));
                    },
                    child: SvgPicture.asset(
                      "assets/icons/ios-log-out.svg",
                      width: 20,
                      height: 20,
                      color: AppColors.wSecondaryColor,
                    )),
              ],
            ),
          ),
        ],
        backgroundColor: AppColors.wPrimaryColor,
        toolbarHeight: 100,
      ),
      sideBar: SideBar(
        items: const [
          AdminMenuItem(title: 'First Year', icon: Icons.dashboard, children: [
            AdminMenuItem(
              title: 'First Semester',
              route: "11",
            ),
            AdminMenuItem(
              title: 'Second Semester',
              route: '12',
            ),
          ]),
          AdminMenuItem(title: 'Second Year', icon: Icons.dashboard, children: [
            AdminMenuItem(
              title: 'First Semester',
              route: '21',
            ),
            AdminMenuItem(
              title: 'Second Semester',
              route: '22',
            ),
          ]),
          AdminMenuItem(title: 'Third Year', icon: Icons.dashboard, children: [
            AdminMenuItem(
              title: 'First Semester',
              route: '31',
            ),
            AdminMenuItem(
              title: 'Second Semester',
              route: '32',
            ),
          ]),
          AdminMenuItem(title: 'Fourth Year', icon: Icons.dashboard, children: [
            AdminMenuItem(
              title: 'First Semester',
              route: '41',
            ),
            AdminMenuItem(
              title: 'Second Semester',
              route: '42',
            ),
          ]),
        ],
        selectedRoute: "",
        onSelected: (item) async {
          switch (item.route) {
            case "11":
              await FirebaseFirestore.instance
                  .collection("Student")
                  .doc(AppUser.appUser!.uid)
                  .collection("First Year")
                  .doc("First Semester")
                  .get()
                  .then((value) async {
                if (value.exists) {
                  setState(() {
                    fillSubjects11 = true;
                  });
                } else {
                  setState(() {
                    fillSubjects11 = false;
                  });
                }
                setState(() {
                  fillSubject = true;
                });
              });

              break;

            case "12":
              await FirebaseFirestore.instance
                  .collection("Student")
                  .doc(AppUser.appUser!.uid)
                  .collection("First Year")
                  .doc("Second Semester")
                  .get()
                  .then((value) async {
                if (value.exists) {
                  setState(() {
                    fillSubjects12 = true;
                  });
                } else {
                  setState(() {
                    fillSubjects12 = false;
                  });
                }
                setState(() {
                  fillSubject = true;
                });
              });
              break;

            case "21":
              await FirebaseFirestore.instance
                  .collection("Student")
                  .doc(AppUser.appUser!.uid)
                  .collection("Second Year")
                  .doc("First Semester")
                  .get()
                  .then((value) async {
                if (value.exists) {
                  setState(() {
                    fillSubjects21 = true;
                  });
                } else {
                  setState(() {
                    fillSubjects21 = false;
                  });
                }
                setState(() {
                  fillSubject = true;
                });
              });
              break;

            case "22":
              await FirebaseFirestore.instance
                  .collection("Student")
                  .doc(AppUser.appUser!.uid)
                  .collection("Second Year")
                  .doc("Second Semester")
                  .get()
                  .then((value) async {
                if (value.exists) {
                  setState(() {
                    fillSubjects22 = true;
                  });
                } else {
                  setState(() {
                    fillSubjects22 = false;
                  });
                }
                setState(() {
                  fillSubject = true;
                });
              });
              break;

            case "31":
              await FirebaseFirestore.instance
                  .collection("Student")
                  .doc(AppUser.appUser!.uid)
                  .collection("Third Year")
                  .doc("First Semester")
                  .get()
                  .then((value) async {
                if (value.exists) {
                  setState(() {
                    fillSubjects31 = true;
                  });
                } else {
                  setState(() {
                    fillSubjects31 = false;
                  });
                }
                setState(() {
                  fillSubject = true;
                });
              });
              break;

            case "32":
              await FirebaseFirestore.instance
                  .collection("Student")
                  .doc(AppUser.appUser!.uid)
                  .collection("Third Year")
                  .doc("Second Semester")
                  .get()
                  .then((value) async {
                if (value.exists) {
                  setState(() {
                    fillSubjects32 = true;
                  });
                } else {
                  setState(() {
                    fillSubjects32 = false;
                  });
                }
                setState(() {
                  fillSubject = true;
                });
              });
              break;

            case "41":
              await FirebaseFirestore.instance
                  .collection("Student")
                  .doc(AppUser.appUser!.uid)
                  .collection("Fourth Year")
                  .doc("First Semester")
                  .get()
                  .then((value) async {
                if (value.exists) {
                  setState(() {
                    fillSubjects41 = true;
                  });
                } else {
                  setState(() {
                    fillSubjects41 = false;
                  });
                }
                setState(() {
                  fillSubject = true;
                });
              });
              break;

            case "42":
              await FirebaseFirestore.instance
                  .collection("Student")
                  .doc(AppUser.appUser!.uid)
                  .collection("Fourth Year")
                  .doc("Second Semester")
                  .get()
                  .then((value) async {
                if (value.exists) {
                  setState(() {
                    fillSubjects42 = true;
                  });
                } else {
                  setState(() {
                    fillSubjects42 = false;
                  });
                }
                setState(() {
                  fillSubject = true;
                });
              });
              break;
          }
          currentScreen(item);
        },
      ),
      body: fillSubject == true
          ? _selectedScreen
          : const CircularProgressIndicator(),
    );
  }
}
