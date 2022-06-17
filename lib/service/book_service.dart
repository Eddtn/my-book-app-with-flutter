import 'dart:convert';

import 'package:my_book_app/models/book_model.dart';
import 'package:http/http.dart' as http;
// import 'package:my_book_app/views/home_view.dart';

class BookService {
  Future<BooksModel> getData() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          "https://hapi-books.p.rapidapi.com/week/horror",
        ),
        headers: {
          'X-RapidAPI-Key':
              '6d18f7b665msh1904bbc2592dc68p1e32bcjsn5cca8d8c8255',
          'X-RapidAPI-Host': 'hapi-books.p.rapidapi.com'
        },
      );
      print('object people');
      final data = jsonDecode(response.body);
      return BooksModel.fromMap(data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
























// // import 'dart:convert';
// import 'dart:convert';

// import 'package:http/http.dart' as http;

// import '../models/book_model.dart';

// class BookService {
//   Future<BooksModel> getData() async {
//     // var client = http.Client();
//     final uri = Uri.parse("https://hapi-books.p.rapidapi.com/week/horror");
//     final response = await http.get(
//       uri,
//       headers: {
//         'X-RapidAPI-Key': '6d18f7b665msh1904bbc2592dc68p1e32bcjsn5cca8d8c8255',
//         'X-RapidAPI-Host': 'hapi-books.p.rapidapi.com'
//       },
//     );
//     // var  response  = await client.get(uri);
//     if (response.statusCode == 200) {
//       // final book = jsonDecode(response.body);
//       // return BooksModel.fromMap(book);
//       print(response.body);
//       print('my people');
//       // final json = response.body;

//       return BooksModelFromJson(json);
//       return getData();
//     } else {
//       print("error");
//     }
//   }
// }

// // class GetBookService {
// //   getBooks() async {
// //     http.Response response = await http.get(
// //       Uri.parse('https://hapi-books.p.rapidapi.com/search/the+walking+dead'),
// //          if (response.statusCode = 200) {
// //       print(response.body);
// //     }
// //     );

// //   }
// // }
