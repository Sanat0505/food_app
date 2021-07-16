import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/pages/signin_page.dart';
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
            fontWeight: FontWeight.bold,
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
          OrderCard(),
          OrderCard(),
          OrderCard(),
          OrderCard(),
          OrderCard(),
        ],
      ),
      bottomNavigationBar: _buildTotalContainer(),
    );
  }
  Widget _buildTotalContainer(){
    return Container(
      height: 260.0,
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children:<Widget> [
          // SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget> [
              Text(
                "Cart Total",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "SecularOne",
                      color: Colors.grey,
                    ),
                ),
              // Spacer(),
              Text(
                "23.0",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "SecularOne",
                      color: Colors.black,
                    ),
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget> [
              Text(
                "Discount",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "SecularOne",
                  color: Colors.grey,
                ),
              ),
              // Spacer(),
              Text(
                "3.0",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "SecularOne",
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget> [
              Text(
                "Tax",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "SecularOne",
                  color: Colors.grey,
                ),
              ),
              // Spacer(),
              Text(
                "0.5",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "SecularOne",
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Divider(height: 40.0,color: Color(0xFFD3D3D3),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget> [
              Text(
                "Sub Total",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "SecularOne",
                  color: Colors.grey,
                ),
              ),
              // Spacer(),
              Text(
                "26.5",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "SecularOne",
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 30.0,),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SignInPage()));
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Center(
                child: Text(
                    "Proceed to Checkout",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "SecularOne",
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
