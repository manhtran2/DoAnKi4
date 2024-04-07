class Comic {
  final String title;
  final String imageUrl;
  final int chapterCount;
  final String timeSinceAdded;
  final int views;
  final int likes;
  final int comments;

  Comic({
    required this.title,
    required this.imageUrl,
    required this.chapterCount,
    required this.timeSinceAdded,
    required this.views,
    required this.likes,
    required this.comments,
  });

  factory Comic.fromJson(Map<String, dynamic> json) {
    return Comic(
      title: json['title'],
      imageUrl: json['imageUrl'],
      chapterCount: json['chapterCount'],
      timeSinceAdded: json['timeSinceAdded'],
      views: json['views'],
      likes: json['likes'],
      comments: json['comments'],
    );
  }
}
List<Map<String, dynamic>> jsonData = [
  {
    'title': 'Chuyện tranh 1',
    'imageUrl': 'images/comic1.jpg',
    'chapterCount': 10,
    'timeSinceAdded': '2 hours ago',
    'views': 100,
    'likes': 50,
    'comments': 30,
  },
  {
    'title': 'Chuyện tranh 2',
    'imageUrl': 'images/comic2.jpg',
    'chapterCount': 10,
    'timeSinceAdded': '2 hours ago',
    'views': 100000,
    'likes': 50,
    'comments': 30,
  },
  {
    'title': 'Chuyện tranh 3',
    'imageUrl': 'images/comic3.jpg',
    'chapterCount': 10,
    'timeSinceAdded': '2 hours ago',
    'views': 11502,
    'likes': 1000,
    'comments': 30,
  },
  {
    'title': 'Chuyện tranh 4',
    'imageUrl': 'images/comic4.jpg',
    'chapterCount': 50,
    'timeSinceAdded': '2 hours ago',
    'views': 10030,
    'likes': 5052,
    'comments': 5552,
  },

  // Other JSON data for comics
];

List<Comic> comicList = jsonData.map((json) => Comic.fromJson(json)).toList();
