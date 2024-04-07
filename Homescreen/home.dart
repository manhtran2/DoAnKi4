import 'package:doanki4/Homescreen/new_stories_screen.dart';
import 'package:doanki4/Homescreen/recommended_stories_screen.dart';
import 'package:doanki4/Homescreen/recommended_stories_widget.dart';
import 'package:flutter/material.dart';
import 'categories_widget.dart';
import 'bxh_hot_widget.dart';
import 'new_stories_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToNewStories(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewStoriesScreen()),
    );
  }

  void _navigateToRecommendedStories(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RecommendedStoriesScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/background2.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Image.asset('images/logo.png', width: 50, height: 50),
                          SizedBox(width: 8),
                          Text(
                            'Sweet Peach',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 28),
                    NewStoriesWidget(title: 'Truyện mới',onTap: () => _navigateToNewStories(context)),
                    SizedBox(height: 28),
                    RecommendedStoriesWidget(title: 'Truyện đề xuất',onTap: () => _navigateToRecommendedStories(context)),
                    SizedBox(height: 28),
                    CategoriesWidget(title: 'Phân loại',onTap: () => _navigateToRecommendedStories(context)),
                    SizedBox(height: 28),
                    BxhHotWidget(title: 'BXH Hot',onTap: () => _navigateToRecommendedStories(context)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.black.withOpacity(0.5),
      //   selectedItemColor: Colors.blue,
      //   unselectedItemColor: Colors.white,
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      //   elevation: 0,
      //   type: BottomNavigationBarType.fixed,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Trang chủ',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: 'Tìm kiếm',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.book),
      //       label: 'Tủ sách',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Tôi',
      //     ),
      //   ],
      // ),
    );
  }
}