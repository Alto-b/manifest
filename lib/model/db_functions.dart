import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:manifest/model/student_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier=ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  final studentdb = await Hive.openBox<StudentModel>('student_db');
  final id = await studentdb.add(value);
  final data = studentdb.get(id);
  await studentdb.put(id, StudentModel(
    photo: data!.photo, 
    name: data.name, 
    gender: data.gender, 
    domain: data.domain, 
    dob: data.dob, 
    mobile: data.mobile, 
    email: data.email));

    print(studentdb.values);
}