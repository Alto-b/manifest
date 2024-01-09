import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manifest/screens/add.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddPage(),)),
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
}