import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:imc/pages/calcula_page.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey),
       
        // textTheme: GoogleFonts.robotoTextTheme()),
      home:  CalculaPage()
    );      
  }
}