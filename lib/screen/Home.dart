import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rental/screen/login.dart';
import 'package:rental/colors/colors.dart';
import 'package:rental/screen/register.dart';
import 'package:rental/utils/route_names.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentPage = 0;

  List pages = [
    LoginPage(),
    Register(),
  ];

  void onTap(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: Container(
        color: tdpurple2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: GNav(
            selectedIndex: currentPage,
            tabBackgroundColor: Colors.grey.shade800,
            backgroundColor: tdpurple2,
            activeColor: Colors.white,
            gap: 8,
            padding: EdgeInsets.all(16),
            onTabChange: onTap,
            tabs: [
              GButton(
                icon: Icons.login_sharp,
                text: "Login",
              ),
              GButton(
                icon: Icons.person_add_alt_1_sharp,
                text: "Sign UP",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
