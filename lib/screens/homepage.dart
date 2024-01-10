import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manifest/helper/student_helper.dart';
import 'package:manifest/model/db_functions.dart';
import 'package:manifest/screens/add.dart';
import 'package:manifest/screens/list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String studentCountText = '';

  @override
  void initState() {
    getStudents();
    super.initState();
  }
  


  @override
  Widget build(BuildContext context) {
    
    return Consumer<StudentProvider>(
      builder: (context, value, child) {
        // value.getCount(c);
        return  Scaffold(
  
        appBar: AppBar(
          toolbarHeight: 120,
          centerTitle: true,
          title: Image.network('https://brototype.com/careers/images/logo/logo-black.png',height: 80,),
        ),
    
        body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
    
                Text(" student registrations"),
                const SizedBox(height: 30,),
                //option 1
                InkWell(overlayColor: const MaterialStatePropertyAll(Colors.amber),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddPage(),)),
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network('https://cdn3d.iconscout.com/3d/premium/thumb/add-user-5788187-4833297.png',
                        colorBlendMode: BlendMode.srcOut,
                    filterQuality: FilterQuality.high,),
                        Text("Register student",style:GoogleFonts.glory(fontSize: 25,fontWeight: FontWeight.w600,letterSpacing: 2),),
                    ]),
                  ),
                ),
        
                const SizedBox(height: 40,),
        
                //option 2
                InkWell(overlayColor: const MaterialStatePropertyAll(Colors.amber),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => StudentList(),)),
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Student details",style:GoogleFonts.glory(fontSize: 25,fontWeight: FontWeight.w600,letterSpacing: 2),),
                        Image.network('https://cdn3d.iconscout.com/3d/premium/thumb/text-paragraph-9896560-8027176.png?f=webp',
                        colorBlendMode: BlendMode.srcOut,
                         filterQuality: FilterQuality.high,),
                    ]),
                  ),
                )
    
    
             
              ],
            ),
          ),
        ),
      );
      }
    );
  }
}