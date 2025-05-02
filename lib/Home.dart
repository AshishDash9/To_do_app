
import 'package:flutter/material.dart';
import 'First_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

       primaryColor: Colors.blueAccent,
        appBarTheme: AppBarTheme()
      ),
      home: First_page(),
      
    );
  }
}