import 'package:flutter/material.dart';

class ChapterPage extends StatefulWidget {
  @override
  _ChapterPageState createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  bool isFavorite = false;
  bool isFilterVisible = false;
  String selectedSortingOption = 'Cũ nhất'; // Lựa chọn sắp xếp mặc định là 'Cũ nhất'
  List<String> chapters = List.generate(10, (index) => 'Chapter ${index + 1}'); // Danh sách chapters ban đầu

  void toggleFilterVisibility() {
    setState(() {
      isFilterVisible = !isFilterVisible;
    });
  }

  void sortChapters(String option) {
    setState(() {
      selectedSortingOption = option;
      if (option == 'Cũ nhất') {
        chapters.sort(); // Sắp xếp chapters theo thứ tự cũ nhất
      } else {
        chapters.sort((a, b) => b.compareTo(a)); // Sắp xếp chapters theo thứ tự mới nhất
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: Colors.black,
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Center(
                  child: Text(
                    'Chương 1',
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Nội dung chương 1 ở đây...',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: isFilterVisible ? MediaQuery.of(context).size.height * 0.6 : 0,
              color: Colors.black, // Màu nền
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            sortChapters('Cũ nhất');
                          },
                          child: Text(
                            'Cũ nhất',
                            style: TextStyle(color: Colors.white), // Màu chữ
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              selectedSortingOption == 'Cũ nhất' ? Colors.red : Colors.grey,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            sortChapters('Mới nhất');
                          },
                          child: Text(
                            'Mới nhất',
                            style: TextStyle(color: Colors.white), // Màu chữ
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              selectedSortingOption == 'Mới nhất' ? Colors.red : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: chapters.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            chapters[index],
                            style: TextStyle(color: Colors.white), // Màu chữ
                          ),
                          onTap: () {
                            // Xử lý khi nhấn vào một chapter
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back, color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                // Xử lý khi nhấn nút chương trước
              },
            ),
            IconButton(
              icon: Icon(Icons.filter_list, color: Colors.white),
              onPressed: () {
                toggleFilterVisibility();
              },
            ),
            IconButton(
              icon: Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
              onPressed: () {
                // Xử lý khi nhấn nút tự động cuộn
              },
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward, color: Colors.white),
              onPressed: () {
                // Xử lý khi nhấn nút chương sau
              },
            ),
          ],
        ),
      ),
    );
  }
}

