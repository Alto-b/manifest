import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:manifest/model/db_functions.dart';
import 'package:manifest/model/student_model.dart';
import 'package:manifest/screens/details.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {

  void initState(){
    super.initState();
    getStudents();
    studentCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("student list"),
      ),

      body:  SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 800,
              child: ValueListenableBuilder(
                valueListenable: studentListNotifier, 
                builder: (BuildContext ctx,List<StudentModel> studentList,Widget? child){
                  return ListView.separated(
                      itemBuilder: ((context,index){
                        final data = studentList[index];
                        return Slidable(
                          endActionPane: ActionPane(
                            motion: const DrawerMotion(), 
                            children:[
                              SlidableAction(onPressed: (context){
                                
                              },icon: Icons.edit,backgroundColor: Colors.lightBlue,),

                            ],
                            ),
                            startActionPane: ActionPane(
                              motion: const DrawerMotion(), 
                              children:[
                                SlidableAction(onPressed: (context){
                                  deleteStudent(data.id!);
                                },icon: Icons.delete,backgroundColor: Colors.red)
                              ]),
                          child: ListTile(
                            onTap: () {
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage( id: index,),));
                            detailsSheet(context, data.id!, data.photo, data.name, data.gender, data.domain, data.dob, data.mobile, data.email);
                            },
                            leading:  CircleAvatar(
                              radius: 40,
                              backgroundImage:FileImage(File(data.photo)) ,
                            ),
                            title: Text(data.name),
                            subtitle: Text(data.domain),
                          ),
                        );
                      }), 
                      separatorBuilder: ((context,index){
                        return const Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: Divider(),
                        );
                      }),   
                      itemCount: studentList.length);
                }),
            )
          ],
        ),
      ),
    );
  }

  void detailsSheet(BuildContext context,int id,String photo,String name,String gender,String domain,String dob,String mobile,String email){
    showModalBottomSheet(context: context, builder: (context){
      return Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          border: Border.all(width: 20,color: Colors.white.withOpacity(0.8)),
        ),
        height: 600,
        width: double.infinity,
        child: Card(
          elevation: 5,
          shadowColor: Colors.blueAccent,
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(25)),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 5,),
              CircleAvatar(
                radius: 40,
                backgroundImage: FileImage(File(photo)),
              ),
              Text("Name : $name",style: textStyle(),),
              Text("Gender : $gender",style: textStyle(),),
              Text("Domain : $domain",style: textStyle(),),
              Text("Date of birth : ${DateFormat('dd-MMM-yyyy').format(DateTime.parse(dob))}",style: textStyle(),),
              Text("Mobile : $mobile",style: textStyle(),),
              Text("Email : $email",style: textStyle(),),
          
              SizedBox(height: 10,)
            ],
          ),
        ),
      );
    });
  }

  TextStyle textStyle() => GoogleFonts.roboto(fontSize: 16);
}