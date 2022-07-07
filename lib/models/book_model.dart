class BooksModel {
  final int book_id;
  final String name;
  final String cover;
  final String url;

  BooksModel({
    required this.book_id,
    required this.name,
    required this.cover,
    required this.url,
  });

  factory BooksModel.fromMap(Map<String, dynamic> json) => BooksModel(
        book_id: json['book_id'],
        name: json['name'],
        cover: json['cover'],
        url: json['url'],
      );

  Map<String, dynamic> toMap() => {
        "book_id": book_id,
        "name": name,
        "cover": cover,
      };
}

class PopularBookModel {
  final String book_id;
  final String position;
  final String name;
  final String cover;
  final rating;
  final String url;

  PopularBookModel({
    required this.book_id,
    required this.position,
    required this.name,
    required this.cover,
    required this.rating,
    required this.url,
  });

  factory PopularBookModel.fromMap(Map<String, dynamic> json) =>
      PopularBookModel(
        book_id: json['book_id'],
        position: json['position'],
        name: json['name'],
        cover: json['cover'],
        rating: json['rating'],
        url: json['url'],
      );
  Map<String, dynamic> toMap() => {
        "book_id": book_id,
        "postion": position,
        "name": name,
        "cover": cover,
        "rating": url,
      };
}
