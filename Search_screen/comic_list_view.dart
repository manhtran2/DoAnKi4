import 'package:flutter/material.dart';

import 'list_screen.dart';



class ComicListView extends StatelessWidget {
  final List<Comic> comics;

  const ComicListView({Key? key, required this.comics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: comics.length,
      itemBuilder: (BuildContext context, int index) {
        final comic = comics[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: SizedBox(
              width: 70,
              child: Image.asset(
                comic.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comic.title,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '${comic.chapterCount} chương',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '${comic.timeSinceAdded}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.visibility, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(
                      '${formatNumber(comic.views)}',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.favorite, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(
                      '${formatNumber(comic.likes)}',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.comment, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(
                      '${formatNumber(comic.comments)}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            onTap: () {
              // Handle tap
            },
          ),
        );
      },
    );
  }

  String formatNumber(int number) {
    if (number >= 1000) {
      double result = number / 1000;
      return '${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)}k';
    } else {
      return number.toString();
    }
  }
}
