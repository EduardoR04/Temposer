import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoggedIn extends StatefulWidget {
  LoggedIn({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoggedIn createState() => _LoggedIn();
}

class _LoggedIn extends State<LoggedIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(''),
      actions: <Widget>[
        Builder(builder: (BuildContext context) {
//5
          return FlatButton(
            child: const Text('Sign out'),
            textColor: Theme.of(context).buttonColor,
            onPressed: () async {
              final FirebaseUser user = await _auth.currentUser();
              if (user == null) {
//6
                Scaffold.of(context).showSnackBar(const SnackBar(
                  content: Text('No one has signed in.'),
                ));
                return;
              }
              await _auth.signOut();
              final String uid = user.uid;
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(uid + ' has successfully signed out.'),
              ));
            },
          );
        })
      ],
    ));
  }
}
