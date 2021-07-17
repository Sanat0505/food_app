import 'package:flutter/material.dart';

class CustomListStyle extends StatelessWidget {

  late final IconData icon;
  late final String text;

  CustomListStyle({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.blue,),
          SizedBox(width: 15.0,),
          Text(
            "${text}",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
