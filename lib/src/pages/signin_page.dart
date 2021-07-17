import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/pages/signup_page.dart';
import 'package:food_app/src/widgets/button.dart';

class SignInPage extends StatefulWidget{
  @override
  _SignInPageState createState() => _SignInPageState();
}
class _SignInPageState extends State<SignInPage>{

  bool _toggelVisibility = true;

  Widget _buildEmailTextField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Enter Email or Username",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
        body: Padding(
        padding: EdgeInsets.symmetric(horizontal:10.0),
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children:<Widget> [
              Text("Sign In",
                style: TextStyle(
                  fontFamily: "SecularOne",
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                ),
              ),
              SizedBox(height: 100.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                      "Forgotten Password ?",
                      style: TextStyle(
                        fontFamily: "SecularOne",
                        fontSize: 18.0,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                  ),
              ],
            ),
            SizedBox(height: 20.0,),
            Card(
              elevation: 10.0,
              child :Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children:<Widget> [
                    _buildEmailTextField(),
                    SizedBox(height: 20.0,),
                    _buildPasswordField(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.0,),
            Button(btnText: "Sign In"),
            Divider(height: 20.0,color: Colors.black,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                Text(
                  "Don't have an account ?",
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
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> SignUpPage()));
                  },
                  child: Text(
                    "Sign Up",
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