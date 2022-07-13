import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:result_sheet_system/core/utils/app_colors.dart';
import 'package:result_sheet_system/features/presentation/views/admin_panel/student_list/student_list.dart';
import 'package:result_sheet_system/features/presentation/views/sign_in/sign_in.dart';

class AdminHome extends StatefulWidget {
  static const String id = "admin_home";

  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  bool studentRegistered11 = false;
  bool studentRegistered12 = false;
  bool studentRegistered21 = false;
  bool studentRegistered22 = false;
  bool studentRegistered31 = false;
  bool studentRegistered32 = false;
  bool studentRegistered41 = false;
  bool studentRegistered42 = false;

  bool loadedData = true;
  Widget _selectedScreen = const Center(
    child: Text("Go and Find!"),
  );

  currentScreen(item) async {
    switch (item.route) {
      case "11":
        setState(() {
          _selectedScreen = studentRegistered11 == true
              ? const StudentList(
                  year: "First Year", semester: "First Semester")
              : const Center(child: Text("Not Student Registered Yet!"));
        });
        break;
      case "12":
        setState(() {
          _selectedScreen = studentRegistered12 == true
              ? const StudentList(
                  year: "First Year", semester: "Second Semester")
              : const Center(child: Text("Not Student Registered Yet!"));
        });
        break;
      case "21":
        setState(() {
          _selectedScreen = studentRegistered21 == true
              ? const StudentList(
                  year: "Second Year", semester: "First Semester")
              : const Center(child: Text("Not Student Registered Yet!"));
        });
        break;
      case "22":
        setState(() {
          _selectedScreen = studentRegistered22 == true
              ? const StudentList(
                  year: "Second Year", semester: "Second Semester")
              : const Center(child: Text("Not Student Registered Yet!"));
        });
        break;
      case "31":
        setState(() {
          _selectedScreen = studentRegistered31 == true
              ? const StudentList(
                  year: "Third Year", semester: "First Semester")
              : const Center(child: Text("Not Student Registered Yet!"));
        });
        break;
      case "32":
        setState(() {
          _selectedScreen = studentRegistered32 == true
              ? const StudentList(
                  year: "Third Year", semester: "Second Semester")
              : const Center(child: Text("Not Student Registered Yet!"));
        });
        break;
      case "41":
        setState(() {
          _selectedScreen = studentRegistered41 == true
              ? const StudentList(
                  year: "Fourth Year", semester: "First Semester")
              : const Center(child: Text("Not Student Registered Yet!"));
        });
        break;
      case "42":
        setState(() {
          _selectedScreen = studentRegistered42 == true
              ? const StudentList(
                  year: "Fourth Year", semester: "Second Semester")
              : const Center(child: Text("Not Student Registered Yet!"));
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('ADMIN PANEL'),
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
        onSelected: (item) async {
          currentScreen(item);

          switch (item.route) {
            case "11":
              await FirebaseFirestore.instance
                  .collection("Admin")
                  .doc("First Year")
                  .collection("First Semester")
                  .get()
                  .then((value) async {
                if (value.size > 0) {
                  setState(() {
                    studentRegistered11 = true;
                  });
                } else {
                  setState(() {
                    studentRegistered11 = false;
                  });
                }
                setState(() {
                  loadedData = true;
                });
              });

              break;

            case "12":
              await FirebaseFirestore.instance
                  .collection("Admin")
                  .doc("First Year")
                  .collection("Second Semester")
                  .get()
                  .then((value) async {
                if (value.size > 0) {
                  setState(() {
                    studentRegistered12 = true;
                  });
                } else {
                  setState(() {
                    studentRegistered12 = false;
                  });
                }
                setState(() {
                  loadedData = true;
                });
              });
              break;

            case "21":
              await FirebaseFirestore.instance
                  .collection("Admin")
                  .doc("Second Year")
                  .collection("First Semester")
                  .get()
                  .then((value) async {
                if (value.size > 0) {
                  setState(() {
                    studentRegistered21 = true;
                  });
                } else {
                  setState(() {
                    studentRegistered21 = false;
                  });
                }
                setState(() {
                  loadedData = true;
                });
              });
              break;

            case "22":
              await FirebaseFirestore.instance
                  .collection("Admin")
                  .doc("Second Year")
                  .collection("Second Semester")
                  .get()
                  .then((value) async {
                if (value.size > 0) {
                  setState(() {
                    studentRegistered22 = true;
                  });
                } else {
                  setState(() {
                    studentRegistered22 = false;
                  });
                }
                setState(() {
                  loadedData = true;
                });
              });
              break;

            case "31":
              await FirebaseFirestore.instance
                  .collection("Admin")
                  .doc("Third Year")
                  .collection("First Semester")
                  .get()
                  .then((value) async {
                if (value.size > 0) {
                  setState(() {
                    studentRegistered31 = true;
                  });
                } else {
                  setState(() {
                    studentRegistered31 = false;
                  });
                }
                setState(() {
                  loadedData = true;
                });
              });
              break;

            case "32":
              await FirebaseFirestore.instance
                  .collection("Admin")
                  .doc("Third Year")
                  .collection("Second Semester")
                  .get()
                  .then((value) async {
                if (value.size > 0) {
                  setState(() {
                    studentRegistered32 = true;
                  });
                } else {
                  setState(() {
                    studentRegistered32 = false;
                  });
                }
                setState(() {
                  loadedData = true;
                });
              });
              break;

            case "41":
              await FirebaseFirestore.instance
                  .collection("Admin")
                  .doc("Fourth Year")
                  .collection("First Semester")
                  .get()
                  .then((value) async {
                if (value.size > 0) {
                  setState(() {
                    studentRegistered41 = true;
                  });
                } else {
                  setState(() {
                    studentRegistered41 = false;
                  });
                }
                setState(() {
                  loadedData = true;
                });
              });
              break;

            case "42":
              await FirebaseFirestore.instance
                  .collection("Admin")
                  .doc("Fourth Year")
                  .collection("Second Semester")
                  .get()
                  .then((value) async {
                if (value.size > 0) {
                  setState(() {
                    studentRegistered42 = true;
                  });
                } else {
                  setState(() {
                    studentRegistered42 = false;
                  });
                }
                setState(() {
                  loadedData = true;
                });
              });
              break;
          }
          currentScreen(item);

          // if (item.route != null) {
          //   Navigator.of(context).pushNamed(item.route!);
          // }
        },
        selectedRoute: "",
      ),
      body: loadedData == true
          ? _selectedScreen
          : const CircularProgressIndicator(),
    );
  }
}
