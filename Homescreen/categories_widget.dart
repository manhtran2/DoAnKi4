import 'dart:async';

import 'package:doanki4/Homescreen/section_title_widget.dart';
import 'package:flutter/material.dart';


class CategoriesWidget extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const CategoriesWidget({required this.title, required this.onTap});

  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  bool isHotIconVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitleWidget(
          title: widget.title,
          onTap: widget.onTap,
        ),
        _buildCategories(context),
      ],
    );
  }

  Widget _buildCategories(BuildContext context) {
    List<Color> colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
    ];
    colors.shuffle();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 5 / 2,
        ),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          Color color1 = colors[(index * 2) % colors.length];
          Color color2 = colors[(index * 2 + 1) % colors.length];
          return GestureDetector(
            onTap: () {},
            onTapDown: (_) {
              setState(() {
                isHotIconVisible = true;
              });
            },
            onTapCancel: () {
              setState(() {
                isHotIconVisible = false;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.6),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'images/backc.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          color1.withOpacity(0.6),
                          color2.withOpacity(0.6),
                        ],
                      ),
                    ),
                  ),
                  if (isHotIconVisible)
                    Align(
                      alignment: Alignment.topRight,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 500),
                        opacity: isHotIconVisible ? 1.0 : 0.0,
                        curve: Curves.easeInOut,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                          Icon(
                            Icons.whatshot,
                            color: Colors.red,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  Center(
                    child: Text(
                      'Mục ${index + 1}',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        isHotIconVisible = !isHotIconVisible;
      });
    });
  }
}