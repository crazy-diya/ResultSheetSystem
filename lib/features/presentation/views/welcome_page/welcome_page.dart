import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:result_sheet_system/core/utils/app_colors.dart';
import 'package:result_sheet_system/features/presentation/views/ar_register/ar_registar.dart';
import 'package:result_sheet_system/features/presentation/views/sign_in/sign_in.dart';
import 'package:result_sheet_system/features/presentation/views/student_register/student_register.dart';
import 'package:result_sheet_system/features/presentation/widgets/default_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 100.0,top: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset("assets/images/seu_logo.svg", width: 200),
                SizedBox(
                  height: height * 0.08,
                ),
                const Text(
                  "WELCOME FOR CHECK YOUR RESULT SHEETS \nWITH GPA",
                  style: TextStyle(
                    fontSize: 40,
                    color: AppColors.wPrimaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: DefaultButton(
                          width: width,
                          height: height,
                          fontSize: 18,
                          title: "SIGN IN",
                          click: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignIn(),
                            ));
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: DefaultButton(
                          width: width,
                          height: height,
                          fontSize: 18,
                          title: "SIGN UP - AR",
                          click: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ArRegister(),
                            ));
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: DefaultButton(
                          width: width,
                          height: height,
                          fontSize: 18,
                          title: "SIGN UP - STUDENT",
                          click: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const StudentRegister(),
                            ));
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
