import 'package:flutter/material.dart';
import 'package:food_app/src/scoped-model/food_model.dart';
import 'package:food_app/src/scoped-model/main_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'screens/main_screen.dart';
class MyApp extends StatelessWidget{

  final MainModel mainModel = MainModel();

  @override
  Widget build(BuildContext context){
    return ScopedModel<MainModel>(
        model: mainModel,
        child: MaterialApp(
          debugShowCheckedModeBanner:false,
          title: "Food App",
          theme: ThemeData(
            primaryColor: Colors.blue,
            fontFamily: 'SacularOne',
          ),
          home: MainScreen(model: mainModel),
        ),
    );
  }
}