import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:manifest/helper/student_helper.dart';
import 'package:manifest/model/student_model.dart';
import 'package:manifest/screens/homepage.dart';
import 'package:provider/provider.dart';

Future<void> main() async{

  
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

   Hive.openBox<StudentModel>('student_db');

  if(!Hive.isAdapterRegistered(StudentModelAdapter().typeId)){
    Hive.registerAdapter(StudentModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>StudentProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            // centerTitle: true,
            iconTheme: IconThemeData(color: Colors.black54),
            titleTextStyle: GoogleFonts.roboto(color: Colors.black54),
            elevation: 0
          ), colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(background: Colors.white)
        ),
        home: const HomePage(),
      ),
    );
  }
}
