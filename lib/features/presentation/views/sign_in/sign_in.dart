import 'package:flutter/material.dart';
import 'package:result_sheet_system/core/utils/app_colors.dart';
import 'package:result_sheet_system/features/presentation/widgets/default_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String name = "";
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
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
                height: 100,
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
                        click: () {}),
                  ),
                  SizedBox(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",

                          ),
                          InkWell(
                            child: Text(" Create",style: TextStyle(
                              color: AppColors.wPrimaryColor,
                            ),),
                            onTap: () => {},
                          )
                        ],
                      ))
                ],
              ),
            ],
          )),
    );
  }
}
