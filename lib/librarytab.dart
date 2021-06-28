import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
// import 'package:fsearch/fsearch.dart';

class LibraryTab extends StatefulWidget {
  @override
  _LibraryTabState createState() => _LibraryTabState();
}

class _LibraryTabState extends State<LibraryTab> {
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
              margin: EdgeInsets.symmetric(horizontal: 25.0),
              child: Theme(
                data: Theme.of(context).copyWith(
                  primaryColor: Color(0xffe7e7e8),
                  hintColor: Color(0xffaaabab),
                ),
                child: TextField(
                  autofocus: false,
                  cursorColor: Colors.white,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: new InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xffaaabab),
                    ),
                    hintText: 'Search',
                    filled: true,
                    fillColor: Color(0xff201F26),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xffaaabab), width: 2.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
              child: Text(
                'Your Collections',
                style: TextStyle(
                  color: Color(0xffe7e7e8),
                  fontSize: 18.0,
                ),
              ),
            ),
            Card(
              child: ListTile(
                tileColor: Colors.white,
                title: Text('My Scores'),
                subtitle: Text('Scores you have uploaded to Temposer'),
                leading: Icon(
                  Icons.cloud_outlined,
                  size: 40.0,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
            ),
            Card(
              child: ListTile(
                tileColor: Colors.white,
                title: Text('Favorites'),
                subtitle: Text('Scores you have added to Favorites'),
                leading: Icon(
                  Icons.favorite_border,
                  size: 40.0,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
            ),
            Card(
              child: ListTile(
                tileColor: Colors.white,
                title: Text('SongBook'),
                subtitle: Text('Locally saved scores (available offline)'),
                leading: Icon(
                  Icons.my_library_add_outlined,
                  size: 40.0,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
            ),
            Card(
              child: ListTile(
                tileColor: Colors.white,
                title: Text('Upload Scores'),
                subtitle: Text('Upload scores and save them to songbook'),
                leading: Icon(
                  Icons.upload_outlined,
                  size: 40.0,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
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
          if (index == 2) {
            Navigator.pushNamed(context, '/usertab');
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
