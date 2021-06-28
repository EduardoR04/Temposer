import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:senior_project/loginscreen.dart';
import 'package:senior_project/signupscreen.dart';
import 'package:senior_project/searchtab.dart';
import 'package:senior_project/librarytab.dart';
import 'package:senior_project/usertab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';


//2
final FirebaseAuth _auth = FirebaseAuth.instance;

class _RegisterEmailSection extends StatefulWidget {
  final String title = 'Registration';
  @override
  State<StatefulWidget> createState() => 
      _RegisterEmailSectionState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
bool _success;
String _userEmail;

class _RegisterEmailSectionState extends State<_RegisterEmailSection> {
@override
  Widget build(BuildContext context) {
    //TODO UI content here
  }
}


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => MyHomePage(
              title: 'Flutter Demo Home Page',
            ),
        '/login': (context) => LoginScreen(),
        '/sign-up': (context) => SignUpScreen(),
        '/searchtab': (context) => SearchTab(),
        '/librarytab': (context) => LibraryTab(),
        '/usertab': (context) => UserTab(),
      },
    );
  }
}




class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: [
        Row(children: [
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            width: 220,
            height: 80,
            child: Stack(
              children: [
                Column(
                  children: [
                    Divider(
                      color: Colors.black,
                      thickness: 2,
                      height: 37,
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 2,
                      height: 4,
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 2,
                      height: 35,
                    )
                  ],
                ),
                Positioned(
                  left: 35,
                  child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle)),
                ),
                Positioned(
                  right: 35,
                  child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle)),
                ),
              ],
            ),
          ),
          Text("   half notes", style: TextStyle(fontSize: 20))
        ]),
        Padding(
          padding: EdgeInsets.all(20),
        ),
        Row(children: [
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            width: 220,
            height: 80,
            child: Stack(
              children: [
                Column(
                  children: [
                    Divider(
                      color: Colors.black,
                      thickness: 2,
                      height: 37,
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 2,
                      height: 4,
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 2,
                      height: 35,
                    )
                  ],
                ),
                Positioned(
                  left: 15,
                  child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle)),
                ),
                Positioned(
                  left: 70,
                  child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle)),
                ),
                Positioned(
                  left: 125,
                  child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle)),
                ),
                Positioned(
                  right: 15,
                  child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle)),
                ),
              ],
            ),
          ),
          Text("   quarter notes", style: TextStyle(fontSize: 18))
        ]),
        Padding(
          padding: EdgeInsets.all(20),
        ),
        Text(
          "Both measures are in 4/4 time",
          style: TextStyle(fontSize: 20),
        )
      ]),
    );
  }
}
