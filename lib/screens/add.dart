import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:manifest/helper/student_helper.dart';
import 'package:manifest/model/db_functions.dart';
import 'package:manifest/model/student_model.dart';
import 'package:provider/provider.dart';

class AddPage extends StatelessWidget {
   AddPage({
    super.key,
    this.isEdit,
    this.stu});

   bool? isEdit = false ;
   StudentModel? stu;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final gender = ['male','female','others'];
  String selGender='';
  final domainList = ['MERN - web development','MEAN - web development','Django and React','Mobile development using Flutter','Data Science','Cyber security'];
  String domain = '';
  File? _selectedImage;
  DateTime dob = DateTime.now();
  String? d;
  DateTime? db;

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentProvider>(
      builder:(context, value, child) => 
       Scaffold(
        appBar: AppBar(
          title: const Text("Add details"),
        ),
    
        body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                    children: [
        
                      InkWell(
                        onTap: () async{
                            final picker = ImagePicker();
                            final pickedImage = await picker.pickImage(source: ImageSource.gallery);
                            if(pickedImage!=null){
                              _selectedImage = File(pickedImage.path);
                              value.getImage(_selectedImage!);
                              }
                        },
                        child: Container(
                          height: 120,width: 120,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 2)
                          ),
                          child: _selectedImage != null
                          ?Image.file(_selectedImage!,fit: BoxFit.fill,)
                          :Icon(Icons.photo)                  
                          ,
                        )
                      ),
        
        
                      const SizedBox(height: 20,),
        
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          hintText: "Name"
                        ),
                      ),
        
                      const SizedBox(height: 20,),
        
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Gender',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
    
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: gender.map((String value1) {
                return Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    children: [
                      Text(
                        value1,
                        style: const TextStyle(
                          fontSize: 12, 
                        ),
                      ),
                      Radio(
                        value: value1,
                        groupValue: selGender,
                        onChanged: (selectedValue) {
                          
                            selGender = selectedValue.toString();
                          value.getGender(selGender);
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
             ],
              ),
            ),
    
        
                      const SizedBox(height: 20,),
      

                DropdownButtonFormField(
                    decoration: InputDecoration(
                        hintText: 'Domain',
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1,
                                color: Color.fromRGBO(117, 185, 237, 1)),
                            borderRadius: BorderRadius.circular(10.0)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(10.0))),
                    items: domainList.map((String domain) {
                      return DropdownMenuItem(
                          value: domain, child: Text(domain));
                    }).toList(),
                    onChanged: (String? domain) {
                      value.getDomain(domain!);
                    }),
        
                      const SizedBox(height: 15,),
        
                      Row(
                        children: [
                          const Text("Date Of Birth"),
                          TextButton(onPressed: ()async{
                              final DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: dob,
                                  firstDate: DateTime(1973),
                                  lastDate: DateTime(2025));
                              if (pickedDate != null && pickedDate != dob) {
                                  dob = pickedDate;
                                  value.getDOB(dob);
                              }
                          }, child: Text(DateFormat('dd-MM-yyyy').format(DateTime.parse("$dob")))),
                        ],
                      ),
        
                      const SizedBox(height: 10,),
        
                      TextFormField(
                        controller: _mobileController,
                        decoration: const InputDecoration(
                          hintText: "Mobile ",
                        ),
                        keyboardType: TextInputType.number,
                      ),
        
                      const SizedBox(height: 20,),
        
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: "Email"
                        ),
                        keyboardType: TextInputType.emailAddress,
                      )
                    ],
                  )),
                ),
    
                const SizedBox(height: 20,),
    
              ElevatedButton.icon(
                onPressed: (){

                  submit(
                    d=value.domain, db = value.dateOfBirth
                  );
                }, 
                icon: Icon(Icons.save), 
                label: Text("Register"))
    
              ],
            ),
          ),
        ),
      ),
    );
  }

//to save
  Future<void> submit(String? d, DateTime? db)async{
    final imagePath = _selectedImage!.path;
    final name = _nameController.text.trim();
    final gender = selGender;
    final domain = d;
    final  dob = db;
    final mobile = _mobileController.text.trim();
    final email = _emailController.text.trim();

  if(_formKey.currentState!.validate()){
    final student = StudentModel(
      photo: imagePath, 
      name: name, 
      gender: gender, 
      domain: domain!,
      dob: dob.toString(), 
      mobile: mobile, 
      email: email);
   addStudent(student);
  }
}


}