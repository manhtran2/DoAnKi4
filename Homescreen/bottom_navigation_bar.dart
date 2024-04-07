import 'package:doanki4/bookcase_screen/bookcase.dart';
import 'package:doanki4/request/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Search_screen/Seach.dart';
import 'home.dart';


class BottomNavigationBarController extends StatefulWidget {
  @override
  _BottomNavigationBarControllerState createState() =>
      _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    Search(),
    Bookcase(),
    Login(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black.withOpacity(0.5),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Tìm kiếm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Tủ sách',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tôi',
          ),
        ],
      ),
    );
  }
}
