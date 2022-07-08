import 'dart:convert';

import 'package:my_book_app/models/book_model.dart';
import 'package:http/http.dart' as http;
// import 'package:my_book_app/views/home_view.dart';

class BookService {
  Future<List<BooksModel>> getData() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          "https://hapi-books.p.rapidapi.com/week/horror",
        ),
        headers: {
          'X-RapidAPI-Key':
              '69944cc6afmsh83bd264740dcb8ep134087jsnaf514b7f3724',
          // '5127ba29c8mshaa7c89a30e6bce1p1705e0jsnd34c4f1caf22',
          'X-RapidAPI-Host': 'hapi-books.p.rapidapi.com'
        },
      );
      print('object people');

      final data = jsonDecode(response.body);
      return (data as List)
          .map<BooksModel>(
              (elemant) => BooksModel.fromMap(elemant as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<PopularBookModel>> getPopularBokks() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          "https://hapi-books.p.rapidapi.com/month/2022/3",
        ),
        headers: {
          'X-RapidAPI-Key':
              '69944cc6afmsh83bd264740dcb8ep134087jsnaf514b7f3724',
          // '5127ba29c8mshaa7c89a30e6bce1p1705e0jsnd34c4f1caf22',
          'X-RapidAPI-Host': 'hapi-books.p.rapidapi.com'
        },
      );
      print('object person people');
      // print(response.body);

      final datas = jsonDecode(response.body);
      return (datas as List)
          .map<PopularBookModel>((elemant) =>
              PopularBookModel.fromMap(elemant as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<AwardedBooksModel>> getAwardedBooks() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          "https://hapi-books.p.rapidapi.com/top/2021",
        ),
        headers: {
          'X-RapidAPI-Key':
              '69944cc6afmsh83bd264740dcb8ep134087jsnaf514b7f3724',
          // '5127ba29c8mshaa7c89a30e6bce1p1705e0jsnd34c4f1caf22',
          'X-RapidAPI-Host': 'hapi-books.p.rapidapi.com'
        },
      );
      print('object person people');
      // print(response.body);

      final datas = jsonDecode(response.body);
      return (datas as List)
          .map<AwardedBooksModel>((elemant) =>
              AwardedBooksModel.fromMap(elemant as Map<String, dynamic>))
          .toList();
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
