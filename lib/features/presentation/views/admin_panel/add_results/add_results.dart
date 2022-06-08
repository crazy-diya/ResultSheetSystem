import 'package:flutter/material.dart';
import 'package:result_sheet_system/core/utils/app_colors.dart';
import 'package:result_sheet_system/features/presentation/views/student_panel/student_home.dart';
import 'package:result_sheet_system/features/presentation/widgets/default_button.dart';

class AddResults extends StatefulWidget {
  const AddResults({Key? key}) : super(key: key);

  @override
  State<AddResults> createState() => _AddResultsState();
}

class _AddResultsState extends State<AddResults> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController sub1 = TextEditingController();
  TextEditingController sub2 = TextEditingController();
  TextEditingController sub3 = TextEditingController();
  TextEditingController sub4 = TextEditingController();
  TextEditingController sub5 = TextEditingController();
  TextEditingController sub6 = TextEditingController();
  TextEditingController sub7 = TextEditingController();
  TextEditingController sub8 = TextEditingController();
  TextEditingController sub9 = TextEditingController();
  TextEditingController sub10 = TextEditingController();
  TextEditingController sub11= TextEditingController();


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
                "ICT114 the Input Results to First Year First Semester",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.wPrimaryColor,
                ),
              ),
              Container(
                height: 500,
                width: 450,
                padding: EdgeInsets.all(25),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Subject Name : ",
                            style: const TextStyle(
                                color: AppColors.wPrimaryColor, fontSize: 15),
                          ),
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              controller: sub1,
                              obscureText: false,
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
                                labelStyle: const TextStyle(
                                    color: AppColors.wPrimaryColor, fontSize: 15),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter index number';
                                }
                                return null;
                              },
                              onChanged: (text) {
                                setState(() {});
                              },
                            ),
                          ),
                         ]
                      ),
                    ),
                  ),
                ),
              ),
              DefaultButton(width: width, height: height, title: "Submit Results", fontSize: 24, click: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => StudentHome(),));
              })
            ],
          ),
        ),
      ),
    );
  }
}
