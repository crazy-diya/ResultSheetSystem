import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:result_sheet_system/core/utils/app_colors.dart';
import 'package:result_sheet_system/features/data/datasources/dataSources.dart';
import 'package:result_sheet_system/features/presentation/views/admin_panel/add_results/add_results.dart';

import '../../../widgets/default_button.dart';

class StudentList extends StatefulWidget {
  final String? year;
  final String? semester;

  const StudentList({
    Key? key,
    this.year,
    this.semester,
  }) : super(key: key);

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  List<String> studentList = [];
  List<String> indexNumberList = [];

  var x = "";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    setState(() {});
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            left: 32.0, right: 32.0, top: 32.0, bottom: 20.0),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Registerd Student list for the ${widget.year} ${widget.semester}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.wPrimaryColor,
                    ),
                  ),
                ),
                Expanded(
                  flex: 18,
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 5,
                    padding: EdgeInsets.zero,
                    children: List.generate(studentList.length, (index) {
                      return indexNumberList.isNotEmpty
                          ? Center(
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => AddResults(
                                      indexNumber: indexNumberList[index],
                                      uId: studentList[index],
                                      semester: widget.semester,
                                      year: widget.year,
                                    ),
                                  ));
                                },
                                color: Colors.greenAccent,
                                child: Text(
                                  indexNumberList[index],
                                  style: GoogleFonts.aBeeZee(),
                                ),
                              ),
                            )
                          : const Center(child: CircularProgressIndicator());
                    }),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 35,
              bottom: 5,
              child: Container(
                height: 40,
                alignment: Alignment.centerRight,
                child: DefaultButton(
                    width: width,
                    height: height,
                    fontSize: 18,
                    title: "Publish All results!",
                    click: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  initState() {
    Database.firestoreAdmin
        .doc(widget.year.toString())
        .collection(widget.semester.toString())
        .get()
        .then((value) async {
      QuerySnapshot snapshot = value;
      for (var x in snapshot.docs) {
        studentList.add(x.id);
      }

      for (int x = 0; x < studentList.length; x++) {
        print(studentList[x]);
        Database.firestoreUser.doc(studentList[x]).get().then((value) async {
          print(value["indexNumber"]);
          setState(() {
            indexNumberList.add(value["indexNumber"]);
          });
        });
      }
      setState(() {});
    });
  }
}
