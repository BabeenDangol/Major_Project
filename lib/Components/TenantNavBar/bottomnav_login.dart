import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:rental/colors/colors.dart';
import 'package:rental/screen/postlisting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rental/screen/Tenant_view.dart';
import 'package:rental/screen/search.dart';
import 'package:rental/screen/setting.dart';

import '../../screen/login.dart';

class TenantBottombar extends StatefulWidget {
  TenantBottombar({super.key});

  @override
  State<TenantBottombar> createState() => _TenantBottombarState();
}

class _TenantBottombarState extends State<TenantBottombar> {
  int _currentIndex = 0;

  List<Widget> _buildScreens() {
    return [
      TenantViewPage(),
      Search(),
      PostListing(),
      Setting(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreens()[_currentIndex],
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: tdpurple2,
          selectedItemColor: tdpurple3,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_outlined),
              label: "Post Listing",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: "Setting",
            ),
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
