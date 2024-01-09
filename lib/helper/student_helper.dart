
import 'dart:io';

import 'package:flutter/material.dart';

class StudentProvider extends ChangeNotifier{

  File? profileImage;
  DateTime? dateOfBirth;
  String? gender;
  String? domain;


//to update image
  getImage(File image){
    profileImage = image;
    notifyListeners();
  }

//to update dob
  getDOB(DateTime dob){
    dateOfBirth = dob;
    notifyListeners();
  }

//to update gender
  getGender(String g){
    gender = g;
    notifyListeners();
  }

//to update domain
  getDomain(String d){
    domain = d;
    notifyListeners();
  }


}