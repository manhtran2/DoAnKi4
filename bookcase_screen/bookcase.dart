import 'package:flutter/material.dart';
import '../Search_screen/comic_list_view.dart';
import '../Search_screen/list_screen.dart';
import 'FilterBookcase.dart';
import 'dart:ui';


class Bookcase extends StatelessWidget {
  final List<String> _tabs = ["Lịch sử", "Theo dõi"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/background1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
            Column(
              children: [
                Positioned(
                  top: 0,
                  height: 200,
                  width: 20,
                  child: Center(
                    child: Text(
                      'Bookcase',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 50),
                Container(
                  height: kToolbarHeight + 50,
                  color: Colors.transparent,
                ),
                Container(
                  height: 50,
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Tìm kiếm...',
                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.5)),
                              prefixIcon: Icon(
                                  Icons.search, color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        IconButton(
                          icon: Icon(Icons.tune, color: Colors.white),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FilterPage()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                TabBar(
                  tabs: _tabs.map((String tab) {
                    return Tab(text: tab);
                  }).toList(),
                  labelColor: Colors.white,
                ),
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: TabBarView(
                      children: [
                        ComicListView(comics: comicList),
                        _buildComicList(comicList),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComicList(List<Comic> comics) {
    return ListView.builder(
      itemCount: comics.length,
      itemBuilder: (context, index) {
        final comic = comics[index];
        return ListTile(
          title: Text(
            comic.title,
            style: TextStyle(
              color: Colors.white, // Set title color to white
            ),
          ),
          subtitle: Row(
            children: [
              Icon(Icons.visibility),
              SizedBox(width: 5),
              Text(comic.views.toString()),
              SizedBox(width: 20),
              Icon(Icons.thumb_up),
              SizedBox(width: 5),
              Text(comic.likes.toString()),
              SizedBox(width: 20),
              Icon(Icons.comment),
              SizedBox(width: 5),
              Text(comic.comments.toString()),
            ],
          ),
          leading: Image.asset(
            comic.imageUrl,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          onTap: () {
            // Handle comic tap
          },
        );
      },
    );
  }
}