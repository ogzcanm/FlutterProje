import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proje/card/add_card.dart';
import 'package:flutter_proje/config/items/app_colors.dart';
import 'package:flutter_proje/pages/person_page.dart';
import 'package:flutter_proje/pages/wallet.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final user = FirebaseAuth.instance.currentUser;
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Wallet(),
    AddCard(),
    Container(
      color: Colors.grey.shade200,
      child: const Center(
        child: Text('Search'),
      ),
    ),
    PersonPage(),
  ];

  //çıkış method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  appBar: AppBar(
        //    backgroundColor: Colors.grey.shade200,
        //    elevation: 0,
        //    actions: [
        //      IconButton(
        //        onPressed: signUserOut,
        //        icon: const Icon(Icons.logout),
        //      ),
        //    ],
        //  ),
        body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
        bottomNavigationBar: _myNavigationBar());
  }

  Container _myNavigationBar() {
    return Container(
      color: AppColors.darkPurpleColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GNav(
          backgroundColor: AppColors.darkPurpleColor,
          color: Colors.white,
          activeColor: Colors.white,
          duration: const Duration(milliseconds: 900),
          tabBackgroundColor: AppColors.extraLightPurple,
          onTabChange: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          gap: 8,
          padding: const EdgeInsets.all(16),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.favorite_border,
              text: 'Likes',
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(
              icon: Icons.person,
              text: 'Person',
            ),
          ],
        ),
      ),
    );
  }
}
