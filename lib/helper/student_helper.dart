
import 'dart:io';

import 'package:flutter/material.dart';

class StudentProvider extends ChangeNotifier{

  File? profileImage;
  DateTime? dateOfBirth;
  String? gender;
  String? domain;
  
  int count = 0;


//to add image
  getImage(File image){
    profileImage = image;
    notifyListeners();
  }

//to add dob
  getDOB(DateTime dob){
    dateOfBirth = dob;
    notifyListeners();
  }

//to add gender
  getGender(String g){
    gender = g;
    notifyListeners();
  }

//to add domain
  getDomain(String d){
    domain = d;
    notifyListeners();
  }



}