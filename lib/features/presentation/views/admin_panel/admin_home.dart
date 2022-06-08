import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:result_sheet_system/core/utils/app_colors.dart';
import 'package:result_sheet_system/features/presentation/views/admin_panel/student_list/student_list.dart';

class AdminHome extends StatefulWidget {
  static const String id = "admin_home";

  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  Widget _selectedScreen = const StudentList(
    year: "First Year",
    semester: "First Semester",
  );

  currentScreen(item) {
    switch (item.route) {
      case "11":
        setState(() {
          _selectedScreen =
              StudentList(year: "First Year", semester: "First Semester");
        });
        break;
      case "12":
        setState(() {
          _selectedScreen =
              StudentList(year: "First Year", semester: "Second Semester");
        });
        break;
      case "21":
        setState(() {
          _selectedScreen =
              StudentList(year: "Second Year", semester: "First Semester");
        });
        break;
      case "22":
        setState(() {
          _selectedScreen =
              StudentList(year: "Second Year", semester: "Second Semester");
        });
        break;
      case "31":
        setState(() {
          _selectedScreen =
              StudentList(year: "Third Year", semester: "First Semester");
        });
        break;
      case "32":
        setState(() {
          _selectedScreen =
              StudentList(year: "Third Year", semester: "Second Semester");
        });
        break;
      case "41":
        setState(() {
          _selectedScreen =
              StudentList(year: "Fourth Year", semester: "First Semester");
        });
        break;
      case "42":
        setState(() {
          _selectedScreen =
              StudentList(year: "Fourth Year", semester: "Second Semester");
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
                    onTap: () {},
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
        selectedRoute: "11",
        onSelected: (item) {
          currentScreen(item);
          // if (item.route != null) {
          //   Navigator.of(context).pushNamed(item.route!);
          // }
        },
        // footer: Container(
        //   height: 50,
        //   width: double.infinity,
        //   color: const Color(0xff444444),
        //   child: const Center(
        //     child: Text(
        //       'footer',
        //       style: TextStyle(
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
      ),
      body: _selectedScreen,
    );
  }
}
