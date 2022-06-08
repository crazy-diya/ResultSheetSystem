import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:result_sheet_system/core/utils/app_colors.dart';
import 'package:result_sheet_system/features/presentation/views/admin_panel/admin_home.dart';
import 'package:result_sheet_system/features/presentation/views/welcome_page/welcome_page.dart';
import 'package:result_sheet_system/features/presentation/widgets/default_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String _dropDownValue = "Student";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "REGISTRATION FORM FOR\nAR",
              style: TextStyle(
                fontSize: 40,
                color: AppColors.wPrimaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 35,
            ),
            Column(children: [
              SizedBox(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/person.svg",
                      color: AppColors.wPrimaryColor,
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "User Type",
                      style: TextStyle(
                        color: AppColors.wPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 175,
                child: DropdownButtonFormField(
                  isExpanded: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: AppColors.wTextFieldBorderColor,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: AppColors.wTextFieldBorderColor,
                        width: 2,
                      ),
                    ),
                  ),
                  value: _dropDownValue,
                  onChanged: (selectedValue) {
                    if (selectedValue is String) {
                      setState(() {
                        _dropDownValue = selectedValue.toString();
                      });
                    }
                  },
                  items: const [
                    DropdownMenuItem(
                      enabled: true,
                      value: "Student",
                      child: Text("Student"),
                    ),
                    DropdownMenuItem(
                      value: "AR",
                      child: Text("AR"),
                    ),
                  ],
                  style: GoogleFonts.playfairDisplay(
                      color: AppColors.wPrimaryColor, fontSize: 18),
                  iconEnabledColor: AppColors.wPrimaryColor,
                  // isExpanded: true,
                ),
              )
            ]),
            const SizedBox(
              height: 35,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 450,
                  height: 40,
                  child: TextFormField(
                    obscureText: false,
                    controller: email,
                    decoration: InputDecoration(
                      fillColor: AppColors.wTextFieldFillColor,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.wTextFieldBorderColor, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      // enabled: true,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.wTextFieldBorderColor, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'Email',
                      labelStyle: const TextStyle(
                          color: AppColors.wPrimaryColor, fontSize: 15),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Field Data';
                      }
                      return null;
                    },
                    onChanged: (email) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                SizedBox(
                  width: 450,
                  height: 40,
                  child: TextFormField(
                    obscureText: true,
                    controller: password,
                    decoration: InputDecoration(
                      fillColor: AppColors.wTextFieldFillColor,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.wTextFieldBorderColor, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      // enabled: true,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.wTextFieldBorderColor, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'Password',
                      labelStyle: const TextStyle(
                          color: AppColors.wPrimaryColor, fontSize: 15),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Field Data';
                      }
                      return null;
                    },
                    onChanged: (password) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.04,
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
                      click: () async {


                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AdminHome(),
                        ));


                        // if (_formKey.currentState!.validate()) {
                        //   User? user = await loginUsingEmailPassword(
                        //     email: email.text.trim(),
                        //     password: password.text.trim(),
                        //     context: context,
                        //   );
                        // }
                      }),
                ),
                SizedBox(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                        ),
                        InkWell(
                          child: const Text(
                            " Create",
                            style: TextStyle(
                              color: AppColors.wPrimaryColor,
                            ),
                          ),
                          onTap: () => {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const WelcomePage(),
                            ))
                          },
                        )
                      ],
                    ))
              ],
            ),
          ],
        )),
      ),
    );
  }

  loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Successfully Login!")));
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const AdminHome(),
            ),
            (route) => false);
      }).onError((error, stackTrace) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString())));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message.toString())));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
