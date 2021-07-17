import 'package:flutter/material.dart';
class SmallButton extends StatelessWidget{
  // const SmallButton({required Key key}) : super(key: key);

  final String btnText;
  SmallButton({required this.btnText});

  @override
  Widget build(BuildContext context){
    return Container(
      height: 25.0,
      width: 60.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Text(
          "$btnText",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16.0,
            fontFamily: 'SecularOne',
          ),
        ),
      ),
    );
  }
}