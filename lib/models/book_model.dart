import 'dart:convert';

// List<Books> bookFromJson(String str) => List<Books>.from(
//       json.decode(str).map((x) => booksToJson(x < Map<String, dynamic>)),
//     );

// String booksToJson(List<Books> data) => json.encode(
//       List<dynamic>.from(data.map((e) => null)),
//     );

class Books {
  // ignore: non_constant_identifier_names
  final String book_id;
  final String name;
  final String cover;
  final String url;

  Books({
    // ignore: non_constant_identifier_names
    required this.book_id,
    required this.name,
    required this.cover,
    required this.url,
  });

  factory Books.fromMap(dynamic json) => Books(
      book_id: json['book_id'],
      name: json['name'],
      cover: json['cover'],
      url: json['url']);
  // Map<String, dynamic> toMap() => {
  //       "book_id": book_id,
  //       "name": name,
  //       "cover": cover,
  //       "url": url,
  //     };

  static List<Books> booksFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Books.fromMap(json);
      // Recipe.fromJson(data);
    }).toList();
  }
}
