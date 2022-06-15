import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:result_sheet_system/core/utils/app_colors.dart';
import 'package:result_sheet_system/features/data/datasources/dataSources.dart';
import 'package:result_sheet_system/features/presentation/views/student_panel/student_home.dart';

import '../../../widgets/default_button.dart';

class AddSubjects extends StatefulWidget {
  final String? year;
  final String? semester;

  const AddSubjects({
    Key? key,
    this.year,
    this.semester,
  }) : super(key: key);

  @override
  State<AddSubjects> createState() => _AddSubjectsState();
}

class _AddSubjectsState extends State<AddSubjects> {
  List<Widget> _children = [];
  int _count = 0;
  List<TextEditingController> controllerSubNameList = [];
  List<TextEditingController> controllerSubCodeList = [];

  final _formKey = GlobalKey<FormState>();
  bool showField = false;



  void _add() {
    showField = true;
    controllerSubNameList = List.from(controllerSubNameList)
      ..add(TextEditingController());
    controllerSubCodeList = List.from(controllerSubCodeList)
      ..add(TextEditingController());

    _children = List.from(_children)
      ..add(
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Subject Name : ",
                        style: const TextStyle(
                            color: AppColors.wPrimaryColor, fontSize: 15),
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: controllerSubNameList[_count],
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
                              return 'Please enter Subject Name';
                            }
                            return null;
                          },
                          onChanged: (text) {
                            setState(() {});
                          },
                        ),
                      ),
                    ]),
                Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Subject Code : ",
                        style: const TextStyle(
                            color: AppColors.wPrimaryColor, fontSize: 15),
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
              ],
            ),
          ),
        ),
      );
    setState(() => ++_count);
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 32.0, right: 32.0, top: 32.0, bottom: 20.0),
            child: Stack(
              children: [
                Column(
                  children: [
                    Text(
                      "Add Subject you Enroll in  ${widget.year} ${widget.semester}",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.wPrimaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    SizedBox(
                        height: height * 0.65,
                        width: width * 0.8,
                        child: showField?ListView(children: _children):const SizedBox()),
                    Container(
                      height: 40,
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FloatingActionButton(
                            tooltip: "Add Subjects",
                            onPressed: _add,
                            backgroundColor: AppColors.wPrimaryColor,
                            elevation: 5,
                            splashColor: Colors.grey,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 29,
                            ),
                          ),
                          DefaultButton(
                              width: width,
                              height: height,
                              fontSize: 18,
                              title: "Submitted Subjects!",
                              click: () {
                                if (_formKey.currentState!.validate()) {
                                  storeSubjectList();
                                }
                              }),
                        ],
                      ),
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

  storeSubjectList() async {
    var subjectNameList = [];
    var subjectCodeList = [];

    for (var x in controllerSubNameList) {
      subjectNameList.add(x.text);
    }
    for (var x in controllerSubCodeList) {
      subjectCodeList.add(x.text);
    }

    var docRef = FirebaseFirestore.instance
        .collection("Student")
        .doc(AppUser.appUser!.uid)
        .collection(widget.year.toString())
        .doc(widget.semester.toString());

    docRef.get().then((value) async {
      if (value.exists) {
        await Database.firestoreStudent
            .doc(AppUser.appUser!.uid)
            .collection(widget.year.toString())
            .doc(widget.semester.toString())
            .update({"SubjectCodes": subjectCodeList});
        await Database.firestoreStudent
            .doc(AppUser.appUser!.uid)
            .collection(widget.year.toString())
            .doc(widget.semester.toString())
            .update({"SubjectNames": subjectNameList});
      } else {
        await Database.firestoreStudent
            .doc(AppUser.appUser!.uid)
            .collection(widget.year.toString())
            .doc(widget.semester.toString())
            .set({"SubjectCodes": subjectCodeList});
        await Database.firestoreStudent
            .doc(AppUser.appUser!.uid)
            .collection(widget.year.toString())
            .doc(widget.semester.toString())
            .update({"SubjectNames": subjectNameList});
      }
    });
    setState(() {
      controllerSubNameList.remove(true);
      controllerSubCodeList.clear();
      showField = false;
    });
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => StudentHome(),));
  }
}
