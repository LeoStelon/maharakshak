import 'package:share/share.dart';
import 'package:flutter/material.dart';

import '../screens/hospitals.dart';
import '../screens/profile.dart';
import '../screens/share.dart';
import '../screens/symptoms.dart';
import '../components/customAppBar.dart';
import '../functions/openLink.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  String appBarTitle = 'Symptoms Log';
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    SymptomsScreen(),
    HospitalsScreen(),
    ShareScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          appBarTitle = 'Symptoms Log';
          break;
        case 1:
          appBarTitle = 'Hospitals';
          break;
        case 2:
          appBarTitle = 'Share';
          break;
        case 3:
          appBarTitle = 'Profile';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      appBar: CustomAppBarComponent(
        leadingWidget: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30,
          color: Colors.white,
          onPressed: () => _drawerKey.currentState.openDrawer(),
        ),
        title: appBarTitle,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Center(
                child: Image(
                  image: AssetImage('images/splashLogo.png'),
                  width: 95,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Donate Now'),
              onTap: () {
                Navigator.pushNamed(context, 'donatescreen');
              },
            ),
            ListTile(
              leading: Icon(Icons.vpn_key),
              title: Text('E - Pass'),
              onTap: () => openLink('https://covid19.mhpolice.in/'),
            ),
            ListTile(
              leading: Icon(Icons.trending_up),
              title: Text('Covid Tracker'),
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text('Helpline'),
              onTap: () => Navigator.pushNamed(context, 'helplinescreen'),
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share App'),
              onTap: () {
                Share.share('check out my website https://example.com');
              },
            ),
            SwitchListTile(
              title: Text('Change Language'),
              onChanged: (bool newValue) {},
              value: true,
            )
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text(
              'Symptoms log',
            ),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              _selectedIndex == 1
                  ? AssetImage('images/hospitalWhite_1.png')
                  : AssetImage('images/hospitals.png'),
            ),
            title: Text('Hospitals'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rss_feed),
            title: Text('Share'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
