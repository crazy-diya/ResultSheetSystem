import 'package:flutter/material.dart';
import 'package:result_sheet_system/core/utils/app_colors.dart';
import 'package:result_sheet_system/features/data/datasources/dataSources.dart';

import '../../../widgets/default_button.dart';

class CheckResults extends StatefulWidget {
  final String? year;
  final String? semester;

  const CheckResults({
    Key? key,
    this.year,
    this.semester,
  }) : super(key: key);

  @override
  State<CheckResults> createState() => _CheckResultsState();
}

class _CheckResultsState extends State<CheckResults> {
  List<String> resultList = [];
  List<String> codeList = [];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    setState((){});


    return Scaffold(
      body: codeList.isEmpty || resultList.isEmpty
          ? const Center(child: Text("No Added Result yet!"))
          : Padding(
              padding: const EdgeInsets.only(
                  left: 32.0, right: 32.0, top: 32.0, bottom: 20.0),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Text(
                        "Result sheet of   ${widget.year} ${widget.semester}",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.wPrimaryColor,
                        ),
                      ),
                      Container(
                        height: height * 0.7,
                        width: 450,
                        padding: EdgeInsets.all(25),
                        child: ListView.builder(
                          itemCount: codeList.length,
                          itemBuilder: (context, index) => Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:  [
                                    Text(
                                      codeList[index].toString(),
                                      style: const TextStyle(
                                          color: AppColors.wPrimaryColor,
                                          fontSize: 15),
                                    ),
                                     Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 50,
                                        child: Text(
                                          resultList[index].toString(),
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.wPrimaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        alignment: Alignment.centerRight,
                        child: DefaultButton(
                            width: width,
                            height: height,
                            fontSize: 18,
                            title: "Download Result Sheet!",
                            click: () {}),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  @override
  initState() {
    Database.firestoreStudent
        .doc(AppUser.appUser!.uid)
        .collection(widget.year.toString())
        .doc(widget.semester.toString())
        .get()
        .then((value) async {
      setState(() {
        resultList = List.from(value.get("SubjectResult"));
      });

      await Database.firestoreStudent
          .doc(AppUser.appUser!.uid)
          .collection(widget.year.toString())
          .doc(widget.semester.toString())
          .get()
          .then((value) async {
        setState(() {
          codeList = List.from(value.get("SubjectCodes"));
        });
      });
    });
  }
}
