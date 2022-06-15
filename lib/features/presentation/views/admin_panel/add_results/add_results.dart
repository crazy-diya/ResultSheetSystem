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
  List<Widget> _children = [];
  int _count = 0;
  List<TextEditingController> controllerSubCodeList = [];

  void _add() {
    controllerSubCodeList = List.from(controllerSubCodeList)
      ..add(TextEditingController());

    _children = List.from(_children)
      ..add(
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Subject Code : ",
                    style:
                        TextStyle(color: AppColors.wPrimaryColor, fontSize: 15),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: controllerSubCodeList[_count],
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
                          return 'Please enter Subject Code';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        setState(() {});
                      },
                    ),
                  ),
                ]),
          ),
        ),
      );
    setState(() => ++_count);
  }

  @override
  initState() {
    for (var i = 0; i < 13; i++) {
      _add();
    }
  }

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
                height: height * 0.7,
                width: 450,
                padding: EdgeInsets.all(25),
                child: ListView(
                  children: _children,
                ),
                // child: ListView.builder(
                //   itemCount: 10,
                //   itemBuilder: (context, index) => Card(
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           Text(
                //             "Subject Name : ",
                //             style: const TextStyle(
                //                 color: AppColors.wPrimaryColor, fontSize: 15),
                //           ),
                //           SizedBox(
                //             width: 150,
                //             child: TextFormField(
                //               controller: sub1,
                //               obscureText: false,
                //               decoration: InputDecoration(
                //                 fillColor: AppColors.wTextFieldFillColor,
                //                 filled: true,
                //                 enabledBorder: OutlineInputBorder(
                //                   borderSide: const BorderSide(
                //                       color: AppColors.wTextFieldBorderColor,
                //                       width: 2.0),
                //                   borderRadius: BorderRadius.circular(10.0),
                //                 ),
                //                 // enabled: true,
                //                 border: OutlineInputBorder(
                //                   borderSide: const BorderSide(
                //                       color: AppColors.wTextFieldBorderColor,
                //                       width: 2.0),
                //                   borderRadius: BorderRadius.circular(10.0),
                //                 ),
                //                 labelStyle: const TextStyle(
                //                     color: AppColors.wPrimaryColor, fontSize: 15),
                //               ),
                //               validator: (value) {
                //                 if (value == null || value.isEmpty) {
                //                   return 'Please enter index number';
                //                 }
                //                 return null;
                //               },
                //               onChanged: (text) {
                //                 setState(() {});
                //               },
                //             ),
                //           ),
                //          ]
                //       ),
                //     ),
                //   ),
                // ),
              ),
              DefaultButton(
                  width: width,
                  height: height,
                  title: "Submit Results",
                  fontSize: 24,
                  click: () {
                    // if(_formKey.currentState!.validate()){
                    //
                    // }
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => StudentHome(),
                    ));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
