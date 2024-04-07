import 'package:doanki4/Search_screen/Filter_Screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'comic_list_view.dart';
import 'list_screen.dart';

class Search extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<Search> {
  bool isFocused = false;
  int selectedIndex = 0; // Chỉ mục của nút được chọn

  String formatNumber(int number) {
    if (number >= 1000) {
      double result = number / 1000;
      return '${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)}k';
    } else {
      return number.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildSearchField(),
                    ),
                    IconButton(
                      icon: Icon(Icons.tune, color: Colors.white),
                      onPressed: () {
                        _showFilterOptions(context);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                _buildNavigationTabs(),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Tất cả - Ngày cập nhập',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ComicListView(comics: comicList),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      style: TextStyle(color: isFocused ? Colors.white : Colors.black),
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(Icons.search, color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onChanged: (value) {
        // Implement search functionality here
      },
      onTap: () {
        setState(() {
          isFocused = true;
        });
      },
      onSubmitted: (value) {
        setState(() {
          isFocused = false;
        });
      },
    );
  }

  Widget _buildNavigationTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTabItem(index: 0, title: 'Tất Cả'),
        _buildTabItem(index: 1, title: 'Hoàn Thành'),
        _buildTabItem(index: 2, title: 'Đang Tiến Hành'),
      ],
    );
  }

  Widget _buildTabItem({required int index, required String title}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: selectedIndex == index ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selectedIndex == index ? Colors.white : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _showFilterOptions(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FilterPage()),
    );
  }
}