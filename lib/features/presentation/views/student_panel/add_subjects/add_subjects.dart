import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:result_sheet_system/core/utils/app_colors.dart';
import 'package:result_sheet_system/features/presentation/views/admin_panel/add_results/add_results.dart';

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
                Text(
                  "Add Subject you Enroll in  ${widget.year} ${widget.semester}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.wPrimaryColor,
                  ),
                ),

                Container(
                  height: 40,
                  alignment: Alignment.centerRight,
                  child: DefaultButton(
                      width: width,
                      height: height,
                      fontSize: 18,
                      title: "Submitted Subjects!",
                      click: () {}),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
