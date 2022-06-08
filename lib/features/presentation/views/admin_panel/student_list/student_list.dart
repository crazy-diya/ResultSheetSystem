import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:result_sheet_system/core/utils/app_colors.dart';
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
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 32.0,right: 32.0,top: 32.0,bottom: 20.0),
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
                    children: List.generate(100, (index) {
                      return Center(
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddResults(),));
                          },
                          color: Colors.greenAccent,
                          child: Text(
                            '${index + 1} . ICT110 ',
                            style: GoogleFonts.aBeeZee(),
                          ),
                        ),
                      );
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
}
