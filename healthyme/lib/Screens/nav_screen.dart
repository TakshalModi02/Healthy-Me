import 'package:flutter/material.dart';
import 'package:healthyme/Screens/profile_screen.dart';

import 'chat_screen.dart';
import 'home_screen.dart';
import 'hub_screen.dart';
import 'learn_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
      HomeScreen(),
      LearnScreen(),
      HubScreen(),
      ChatScreen(),
      ProfileScreen(),
  ];

  final Map<String, IconData> _icons = const {
    'Home': Icons.home,
    'Learn': Icons.menu_book,
    'Hub' : Icons.dashboard,
    'Chat': Icons.chat_bubble_outline_rounded,
    'Profile': Icons.account_circle,
  };

  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff0D131F),
      body: _screens[_currIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _icons.map((title, icon) => MapEntry(
            title,
            BottomNavigationBarItem(
              icon: Icon(icon,size: width/15),
              label: title,
            )))
            .values
            .toList(),
        currentIndex: _currIndex,
        selectedItemColor: Color(0xff598BED),
        selectedFontSize: 11.0,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 11.0,
        backgroundColor: Colors.white,
        onTap: (index) => setState(() => _currIndex = index),
      ),
    );
  }
}