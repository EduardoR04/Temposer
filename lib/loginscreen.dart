import 'package:flutter/material.dart';
import 'package:senior_project/loggedin.dart';
import 'package:senior_project/main.dart';
import 'package:senior_project/signupscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
bool _success;
String _userEmail;

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  void _signInWithEmailAndPassword() async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;

    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoggedIn()),
      );
    } else {
      setState(() {
        _success = false;
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
                  controller: _emailController,
                  // keyboardType: Alters keyboard when entering email to show @ and . symbols
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
                  controller: _passwordController,
                  // obscureText hides password text
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
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 130.0),
                  color: Color(0xff4466cc),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _signInWithEmailAndPassword();
                      Navigator.pushNamed(context, '/searchtab');
                    }
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Color(0xff2a2833),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),

              // Space Between Sign In button and Forgot password Text
              SizedBox(
                height: 5.0,
                width: 150.0,
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 130.0),
                  color: Color(0xff4466cc),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Color(0xff2a2833),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              // Forgot your password text
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign-up');
                      },
                      child: Text(
                        'Dont have an account?',
                        style: TextStyle(
                          color: Color(0xFF6F92C5),
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                /*
                child: Text(
                  _success == null
                      ? ''
                      : (_success == true
                          ? 'Sucess!' + Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoggedIn()),
                            )
                          : 'Sign in failed'),
                  style: TextStyle(color: Colors.red),
                ),
                */
              )
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
