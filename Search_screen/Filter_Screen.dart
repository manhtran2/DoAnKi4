import 'package:flutter/material.dart';
import 'dart:ui';
import 'ListFilter.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  int selectedIndex = 0;
  bool isCategorySelected = false;
  bool isSortSelected = false;
  bool isApplySelected = false; // Thêm biến này

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Bộ Lọc',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 40),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isCategorySelected = true;
                          isSortSelected = false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Thể Loại',
                          style: TextStyle(color : Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                Column(
                  children: [
                    for (var i = 0; i < GenreData.genres.length; i += 3)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          for (var j = i; j < i + 3 && j < GenreData.genres.length; j++)
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = j;
                                  isCategorySelected = true;
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width / 3.5, // Chiều rộng của mỗi container
                                height: 50, // Chiều cao cố định của mỗi container
                                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                                decoration: BoxDecoration(
                                  color: selectedIndex == j ? Colors.red : null,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    GenreData.genres[j],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
