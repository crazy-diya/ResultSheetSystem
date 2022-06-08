import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:result_sheet_system/core/utils/app_colors.dart';
import 'package:result_sheet_system/features/presentation/views/sign_in/sign_in.dart';
import 'package:result_sheet_system/features/presentation/widgets/default_button.dart';

class ArRegister extends StatefulWidget {
  const ArRegister({Key? key}) : super(key: key);

  @override
  State<ArRegister> createState() => _ArRegisterState();
}

class _ArRegisterState extends State<ArRegister> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  String name = "";
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController faculty = TextEditingController();

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
            SizedBox(
              height: height * 0.08,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 1000,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 450,
                        height: 40,
                        child: TextFormField(
                          obscureText: false,
                          controller: username,
                          decoration: InputDecoration(
                            fillColor: AppColors.wTextFieldFillColor,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.wTextFieldBorderColor,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            // enabled: true,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.wTextFieldBorderColor,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: 'Username',
                            labelStyle: const TextStyle(
                                color: AppColors.wPrimaryColor, fontSize: 15),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Field Data';
                            }
                            return null;
                          },
                          onChanged: (text) {
                            setState(() {});
                          },
                        ),
                      ),
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
                                  color: AppColors.wTextFieldBorderColor,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            // enabled: true,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.wTextFieldBorderColor,
                                  width: 2.0),
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 65,
                ),
                SizedBox(
                  width: 1000,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                                  color: AppColors.wTextFieldBorderColor,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            // enabled: true,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.wTextFieldBorderColor,
                                  width: 2.0),
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
                      SizedBox(
                        width: 450,
                        height: 40,
                        child: TextFormField(
                          obscureText: false,
                          controller: mobile,
                          decoration: InputDecoration(
                            fillColor: AppColors.wTextFieldFillColor,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.wTextFieldBorderColor,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            // enabled: true,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.wTextFieldBorderColor,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: 'Mobile No',
                            labelStyle: const TextStyle(
                                color: AppColors.wPrimaryColor, fontSize: 15),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Field Data';
                            }
                            return null;
                          },
                          onChanged: (text) {
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 65,
                ),
                SizedBox(
                  width: 1000,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 450,
                        height: 40,
                        child: TextFormField(
                          obscureText: false,
                          controller: faculty,
                          decoration: InputDecoration(
                            fillColor: AppColors.wTextFieldFillColor,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.wTextFieldBorderColor,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            // enabled: true,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.wTextFieldBorderColor,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: 'Faculty name',
                            labelStyle: const TextStyle(
                                color: AppColors.wPrimaryColor, fontSize: 15),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Field Data';
                            }
                            return null;
                          },
                          onChanged: (text) {
                            setState(() {});
                          },
                        ),
                      ),
                    ],
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
                      title: "SIGN UP",
                      click: () async {
                        if (_formKey.currentState!.validate()) {
                          await createUserWithEmailAndPassword();
                        }
                      }),
                ),
                SizedBox(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                        ),
                        InkWell(
                          child: Text(
                            " Sign in",
                            style: TextStyle(
                              color: AppColors.wPrimaryColor,
                            ),
                          ),
                          onTap: () => {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignIn(),
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

  createUserWithEmailAndPassword() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email.text.trim().toString(),
            password: password.text.trim().toString())
        .then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Successfully Created!")));
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const SignIn(),
          ),
          (route) => false);
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    });
  }
}
