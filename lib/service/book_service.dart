// import 'dart:convert';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/book_model.dart';

class BookService {
  Future<List<Books>?> getBooks() async {
    var client = http.Client();
    final uri = Uri.parse("https://hapi-books.p.rapidapi.com/week/horror");
    final response = await http.get(
      uri,
      headers: {
        'X-RapidAPI-Key': 'd69ab507fbmshe55c25b1e3ce29dp162f48jsn138eec587d27',
        'X-RapidAPI-Host': 'hapi-books.p.rapidapi.com'
      },
    );
    // var  response  = await client.get(uri);
    if (response.statusCode == 200) {
      // print(response.body);
      print('my people');
      var json = response.body;

      return getBooks();

      // return bookFromJson(json);
    }
  }
}

// class GetBookService {
//   getBooks() async {
//     http.Response response = await http.get(
//       Uri.parse('https://hapi-books.p.rapidapi.com/search/the+walking+dead'),
//          if (response.statusCode = 200) {
//       print(response.body);
//     }
//     );

//   }
// }
