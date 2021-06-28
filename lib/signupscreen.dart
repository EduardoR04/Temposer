import 'package:flutter/material.dart';
import 'package:senior_project/loginscreen.dart';
import 'package:senior_project/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpScreen createState() => _SignUpScreen();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
bool _success;
String _userEmail;

class _SignUpScreen extends State<SignUpScreen> {
  void _register() async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _success = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Color(0xff2a2833),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image Container
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // mainAxisSize: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 300.0,
                      child: Image(
                        image: AssetImage('assets/images/logo.png'),
                        height: 75.0,
                        width: 75.0,
                      ),
                    ),
                  ],
                ),
              ),
              // Email Text Field
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  // keyboardType: Alters keyboard when entering email to show @ and . symbols
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffD3D3D5),
                    hintText: 'Email',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              // Line Between Email & Password Text Fields
              SizedBox(
                height: 2.0,
              ),
              // Password Text Field
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  // obscureText hides password text
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffD3D3D5),
                    hoverColor: Colors.black,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              // Space Between Text Fields and Sign In button
              SizedBox(
                height: 20.0,
                width: 150.0,
              ),
              // Sign In button
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 120.0),
                  color: Color(0xff4466cc),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _register();
                    }
                  },
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      color: Color(0xff2a2833),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              // Space Between Sign In button and Forgot password Text
              SizedBox(
                height: 20.0,
                width: 150.0,
              ),
              // Forgot your password text
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 120.0),
                  color: Color(0xff4466cc),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    'Already have an Account?',
                    style: TextStyle(
                      color: Color(0xff2a2833),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
