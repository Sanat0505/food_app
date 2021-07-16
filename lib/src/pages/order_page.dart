import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Order Page"),
    );
  }
}
