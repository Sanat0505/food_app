import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/widgets/custom_liststyle.dart';
import 'package:food_app/src/widgets/small_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  bool turnLocation = false;
  bool turnNotification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(

          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Profile",
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'SacularOne',
              ),
              ),
              SizedBox(height: 20.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5.0,
                          offset: Offset(0, 4.0),
                          color: Colors.black38,
                        )
                      ],
                      image: DecorationImage(
                        image: AssetImage("assets/images/breakfast.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    //child: Image.asset("assets/images/breakfast.png", f),
                  ),
                  SizedBox(width: 20.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Yashik Khunt",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      SizedBox(height: 10.0,),
                      Text("9157836636",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      SmallButton(btnText:"Edit"),

                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.0,),
              Text(
                "Account",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0,),
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      CustomListStyle(
                        icon: Icons.location_on,
                        text: "Location",
                      ),
                      Divider(height: 10.0,color: Colors.grey),
                      CustomListStyle(
                        icon: Icons.visibility,
                        text: "Change Password",
                      ),
                      Divider(height: 10.0,color: Colors.grey),
                      CustomListStyle(
                        icon: Icons.shopping_cart,
                        text: "Shipping",
                      ),
                      Divider(height: 10.0,color: Colors.grey),
                      CustomListStyle(
                        icon: Icons.payment,
                        text: "Payment",
                      ),
                      Divider(height: 10.0,color: Colors.grey),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20.0,),
              Text(
                "Notifications",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0,),

              Card(
                elevation: 3.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "App Notification",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Switch(
                            value: turnNotification,
                            onChanged: (bool value) {
                              setState(() {
                                turnNotification = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(height: 10.0,color: Colors.grey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Location Tracking",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Switch(
                            value: turnLocation,
                            onChanged: (bool value) {
                              setState(() {
                                turnLocation = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(height: 10.0,color: Colors.grey),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20.0,),
              Text(
                "Other",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0,),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Language",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        //SizedBox(height: 10.0,),
                        Divider(height: 30.0,color: Colors.grey),
                        Text(
                          "Currency",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Divider(height: 30.0,color: Colors.grey),
                      ],
                    ),
                  ),
                ),
              ),


            ] ,
          ),
        ),
      ),
    );
  }
}
