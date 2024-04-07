import 'package:flutter/material.dart';


class Chapter extends StatefulWidget {
  @override
  _ChapterScreenState createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<Chapter> {
  int selectedChapterIndex = -1;
  bool oldestSelected = false;
  bool newestSelected = false;

  List<String> chapters = [
    'Chapter 1',
    'Chapter 2',
    'Chapter 3',
    'Chapter 4',
    'Chapter 5',
    'Chapter 6',
    'Chapter 7',
    'Chapter 8',
    'Chapter 9',
    'Chapter 10',
  ];

  String convertNumber(int number) {
    if (number >= 10000) {
      return '${(number / 1000).toStringAsFixed(0)}k';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}k';
    } else {
      return number.toString();
    }
  }

  void sortChapters(bool ascending) {
    setState(() {
      if (ascending) {
        chapters.sort();
      } else {
        chapters.sort((a, b) => b.compareTo(a));
      }
      oldestSelected = ascending;
      newestSelected = !ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('images/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              color: Colors.black,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0),
                  Text(
                    'Dragon Ball 7 viên ngọc rồng ',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Container(
                    height: 2.0,
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                  ),
                  SizedBox(height: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.remove_red_eye, color: Colors.white),
                          SizedBox(width: 5.0),
                          Text(
                            convertNumber(1000),
                            style: TextStyle(fontSize: 16, color: Colors.white, decoration: TextDecoration.none),
                          ),
                          SizedBox(width: 20.0),
                          Icon(Icons.favorite, color: Colors.white),
                          SizedBox(width: 5.0),
                          Text(
                            convertNumber(10000),
                            style: TextStyle(fontSize: 16, color: Colors.white, decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                      Container(
                        height: 2.0,
                        color: Colors.white,
                        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      ),
                      Text(
                        'Thể loại: Hành động, Phiêu lưu',
                        style: TextStyle(fontSize: 20, color: Colors.white, decoration: TextDecoration.none),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Container(
                    height: 2.0,
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Chapter',
                        style: TextStyle(fontSize: 20, color: Colors.white, decoration: TextDecoration.none),
                        textAlign: TextAlign.left,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () => sortChapters(true),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(oldestSelected ? Colors.red : Colors.transparent  ),
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            ),
                            child: Text('Cũ nhất'),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () => sortChapters(false),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(newestSelected ? Colors.red : Colors.transparent),
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            ),
                            child: Text('Mới nhất'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.black, // Đặt màu nền của danh sách thành màu đen
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: chapters.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedChapterIndex = index;
                      });
                    },
                    child: Container(
                      color: selectedChapterIndex == index ? Colors.red : Colors.transparent,
                      child: ListTile(
                        title: Text(
                          chapters[index],
                          style: TextStyle(
                            color: Colors.white, // Đặt màu chữ thành màu trắng
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
