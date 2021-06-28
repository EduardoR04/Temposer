import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

class UserTab extends StatefulWidget {
  @override
  _UserTabState createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  var selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xff2a2833),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Image(
                      image: AssetImage('assets/images/logo2.png'),
                      width: 300.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Image.network(
                        'https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg'),
                    height: 100.0,
                    width: 100.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      'Username',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
              child: Text(
                'Settings',
                style: TextStyle(
                  color: Color(0xffe7e7e8),
                  fontSize: 18.0,
                ),
              ),
            ),
            Card(
              child: ListTile(
                tileColor: Colors.white,
                title: Text('Reset Password'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
            ),
            Card(
              child: ListTile(
                tileColor: Colors.white,
                title: Text('Change Avatar'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
            ),
            Card(
              child: ListTile(
                tileColor: Colors.white,
                title: Text('Delete Account'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
            ),
            Card(
              child: ListTile(
                tileColor: Colors.white,
                title: Center(
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Color(0xff2a2833),
          selectedItemBorderColor: Color(0xffe7e7e8).withOpacity(0.25),
          selectedItemBackgroundColor: Color(0xff2a2833),
          selectedItemIconColor: Color(0xffe7e7e8),
          selectedItemLabelColor: Color(0xffe7e7e8),
          selectedItemTextStyle: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
          unselectedItemIconColor: Color(0xffaaabab),
          unselectedItemLabelColor: Color(0xffaaabab),
          unselectedItemTextStyle: TextStyle(
            fontSize: 12.0,
          ),
          itemWidth: 50.0,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/searchtab');
          }
          if (index == 1) {
            Navigator.pushNamed(context, '/librarytab');
          }
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.search,
            label: 'Browse',
          ),
          FFNavigationBarItem(
            iconData: Icons.library_music_outlined,
            label: 'Library',
          ),
          FFNavigationBarItem(
            iconData: Icons.person_outline,
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
