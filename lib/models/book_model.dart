class BooksModel {
  // ignore: non_constant_identifier_names
  final String book_id;
  final String name;
  final String cover;
  final String url;

  BooksModel({
    // ignore: non_constant_identifier_names
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
