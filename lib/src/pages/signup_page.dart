import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/pages/signin_page.dart';

class SignUpPage extends StatefulWidget{
  @override
  _SignUpPageState createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage>{

  bool _toggelVisibility = true;
  bool _toggleConfirmVisibility = true;

  Widget _buildEmailTextField(){
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Enter Email",
          hintStyle: TextStyle(
            color: Color(0XFFBDC2CB),
            fontSize: 18.0,
            fontFamily: "SecularOne",
          )
      ),
    );
  }

  Widget _buildUsernameTextField(){
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Enter Username",
          hintStyle: TextStyle(
            color: Color(0XFFBDC2CB),
            fontSize: 18.0,
            fontFamily: "SecularOne",
          )
      ),
    );
  }

  Widget _buildPasswordField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(
          color: Color(0XFFBDC2CB),
          fontSize: 18.0,
          fontFamily: "SecularOne",
        ),
        suffixIcon: IconButton(
          icon:_toggelVisibility ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
          onPressed: () {
            setState(() {
              _toggelVisibility = !_toggelVisibility;
            });
          },
        ),
      ),
      obscureText: _toggelVisibility,
    );
  }

  Widget _buildConfirmPasswordField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Confirm Password",
        hintStyle: TextStyle(
          color: Color(0XFFBDC2CB),
          fontSize: 18.0,
          fontFamily: "SecularOne",
        ),
        suffixIcon: IconButton(
          icon:_toggleConfirmVisibility ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
          onPressed: () {
            setState(() {
              _toggleConfirmVisibility = !_toggleConfirmVisibility;
            });
          },
        ),
      ),
      obscureText: _toggleConfirmVisibility,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal:10.0),
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children:<Widget> [
            Text("Sign Up",
              style: TextStyle(
                fontFamily: "SecularOne",
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
            SizedBox(height: 50.0,),
            // SizedBox(height: 20.0,),
            Card(
              elevation: 10.0,
              child :Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children:<Widget> [
                    _buildEmailTextField(),
                    SizedBox(height: 20.0,),
                    _buildUsernameTextField(),
                    SizedBox(height: 20.0,),
                    _buildPasswordField(),
                    SizedBox(height: 20.0,),
                    _buildConfirmPasswordField(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.0,),
            Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontFamily: "SecularOne",
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Divider(height: 20.0,color: Colors.black,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                Text(
                  "Already have an account ?",
                  style: TextStyle(
                    fontFamily: "SecularOne",
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Color(0xFFBDC2CB),
                  ),
                ),
                SizedBox(width: 10.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> SignInPage()));
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontFamily: "SecularOne",
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}