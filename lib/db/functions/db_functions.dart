
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_new/db/model/data_model.dart';

ValueNotifier<List<StudentModel>> studentNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  final id = await studentDb.add(value);
  value.id = id as int?;
  studentNotifier.value.add(value);
  studentNotifier.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  studentNotifier.value.clear();
  studentNotifier.value.addAll(studentDb.values);
  studentNotifier.notifyListeners();
}

Future<void> deleteStudent(int id) async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  await studentDb.delete(id);
  await getAllStudents(); 
}
