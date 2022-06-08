import 'package:flutter/material.dart';
import 'package:result_sheet_system/core/utils/app_colors.dart';

class AddResults extends StatefulWidget {
  const AddResults({Key? key}) : super(key: key);

  @override
  State<AddResults> createState() => _AddResultsState();
}

class _AddResultsState extends State<AddResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          Text(
            "ICT114",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.wPrimaryColor,
            ),
          ),
        ],
        ),
      ),
    );
  }
}
