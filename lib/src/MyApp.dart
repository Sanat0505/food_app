import 'package:flutter/material.dart';
import 'package:food_app/src/homescreen.dart';
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: "Food App",
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'SacularOne',
      ),
      home: HomeScreen(),
    );
  }
}