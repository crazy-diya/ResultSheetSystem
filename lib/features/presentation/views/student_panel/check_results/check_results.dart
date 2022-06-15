import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:result_sheet_system/core/utils/app_colors.dart';
import 'package:result_sheet_system/features/presentation/views/admin_panel/add_results/add_results.dart';

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
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
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
                            children: const [
                              Text(
                                "Subject Name : ",
                                style: TextStyle(
                                    color: AppColors.wPrimaryColor,
                                    fontSize: 15),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "A",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.wPrimaryColor,
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
}
