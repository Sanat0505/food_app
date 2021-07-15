import 'package:flutter/material.dart';

class SearchField extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    return Material(
        elevation: 10.0,
        borderRadius: BorderRadius.circular(30.0),
        child :TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 15.0),
          hintText: "Search Your Food",
          suffixIcon:Material(
            elevation: 10.0,
            borderRadius: BorderRadius.circular(30.0),
            child : Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          border: InputBorder.none,
        ),
       ),
      );
  }
}