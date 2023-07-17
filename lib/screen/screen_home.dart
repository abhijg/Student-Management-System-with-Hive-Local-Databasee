import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_new/db/functions/db_functions.dart';
import 'package:hive_new/screen/add_student.dart';
import 'package:hive_new/screen/list_student.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {

    addStudent(){};
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AddStudentWidget(),
            const Expanded(child: ListStudentWideget()),
          ],
        ),
        ),
    );
  }
}