import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//widets
import '../widgets/order_card.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
            "Your Food Cart",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'SecularOne',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          OrderCard(),

        ],
      ),
    );
  }
}
