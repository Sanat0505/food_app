import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String btnText;
  Button({required this.btnText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Center(
        child: Text(
          "$btnText",
          style: TextStyle(
            // fontFamily: "SecularOne",
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
