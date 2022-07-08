import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_book_app/models/book_model.dart';
import 'package:my_book_app/service/book_service.dart';
import 'package:my_book_app/views/detail_book_page.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BooksModel> books = [];
  List<PopularBookModel> popularBooks = [];
  List<AwardedBooksModel> booksAwarded = [];

  late WebViewController controller;
  double rating = 0;

  bool isLoaded = false;
  bool isLoading = false;
  // bool isLoading = false;

  @override
  void initState() {
    // Future.delayed(Duration(seconds: 5), (() => getData()));
    getData();
    getPopularBokks();
    getAwardedBook();
    super.initState();
  }

  getData() async {
    try {
      setState(() {
        isLoaded = true;
      });

      final bookService = BookService();
      books = await bookService.getData();

      setState(() {
        isLoaded = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoaded = false;
      });
    }
  }

  getPopularBokks() async {
    try {
      setState(() {
        isLoaded = true;
      });

      final bookService = BookService();
      popularBooks = await bookService.getPopularBokks();
      print('///////////getpopularbook/////////////');
      print(popularBooks);

      setState(() {
        isLoaded = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoaded = false;
      });
    }
  }

  getAwardedBook() async {
    try {
      setState(() {
        isLoaded = true;
      });

      final bookService = BookService();
      booksAwarded = await bookService.getAwardedBooks();

      // print('///////////getpopularbook/////////////');
      // print(popularBooks);

      setState(() {
        isLoaded = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoaded = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? const Center(child: CircularProgressIndicator())
        : WillPopScope(
            onWillPop: (() async {
              if (await controller.canGoBack()) {
                controller.goBack();
                return false;
              } else {
                return true;
              }

              // return false;
            }),
            child: Scaffold(
              // backgroundColor: Colors.grey,
              body: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: FutureBuilder(
                    builder: (context, response) {
                      return CustomScrollView(
                        slivers: [
                          SliverAppBar(
                            actions: const [
                              Icon(
                                Icons.search,
                                size: 40,
                              ),
                            ],
                            title: const Text('My Book App with Flutter'),
                            leading: IconButton(
                                onPressed: () async {
                                  if (await controller.canGoBack()) {
                                    controller.goBack();
                                  }
                                },
                                icon: const Icon(Icons.arrow_back)),
                            backgroundColor: Colors.blue,
                            floating: true,
                            expandedHeight: 80,
                            pinned: true,
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                              height: 380,
                              width: 100,
                              color: const Color(0xff2C2C2C),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: books.length,
                                itemBuilder: (BuildContext context, index) =>
                                    InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            // BookDetailedPage()));
                                            WebView(
                                          initialUrl: "${books[index].url}",
                                          //  "${books[index].url}",

                                          javascriptMode:
                                              JavascriptMode.unrestricted,
                                          onWebViewCreated: (controller) {
                                            this.controller = controller;
                                            // _controller.complete(controller);
                                          },
                                          onPageFinished: (finish) {
                                            setState(() {
                                              isLoaded = true;
                                            });
                                            setState(() {
                                              isLoaded = false;
                                            });
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 350,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // color: const Color(0xffF78376),
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          child: CachedNetworkImage(
                                            fit: BoxFit.contain,
                                            imageUrl: "${books[index].cover}",
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          child: Container(
                                            height: 60,
                                            width: 280,
                                            color: const Color(0xff2C2C2C),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 10,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Book_id: ${books[index].book_id}",
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "Book Name: ${books[index].name}",
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                // Text(
                                                //   books[index].name,
                                                //   style: TextStyle(
                                                //       color: Colors.white),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SliverToBoxAdapter(
                            child: SizedBox(
                              height: 5,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Icon(
                                        Icons.add_box,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'choose what you want',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Icon(
                                        Icons.more_horiz,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                              height: 40,
                              width: 100,
                              color: const Color(0xff2C2C2C),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 7,
                                itemBuilder: (BuildContext context, index) =>
                                    Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: Colors.blue),
                                      borderRadius: BorderRadius.circular(20),
                                      // color: Colors.red,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'literature',
                                        style: TextStyle(
                                            color: Color(0xff2C4855),
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                              height: 40,
                              width: 100,
                              color: const Color(0xff2C2C2C),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 7,
                                itemBuilder: (BuildContext context, index) =>
                                    Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: Colors.blue),
                                      borderRadius: BorderRadius.circular(20),
                                      // color: Colors.red,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'literature',
                                        style: TextStyle(
                                            color: Color(0xff2C4855),
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.filter_1,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    'Most Popular 15 Books Of The Month',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                              height: 300,
                              width: 20,
                              color: const Color(0xff2C2C2C),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: popularBooks.length,
                                itemBuilder: (BuildContext context, index) =>
                                    InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => isLoading
                                              ? const Center(
                                                  child:
                                                      CircularProgressIndicator())
                                              : WebView(
                                                  initialUrl:
                                                      "${popularBooks[index].url}",
                                                  //  "${books[index].url}",

                                                  javascriptMode: JavascriptMode
                                                      .unrestricted,
                                                  onWebViewCreated:
                                                      (controller) {
                                                    this.controller =
                                                        controller;
                                                    // _controller.complete(controller);
                                                  },
                                                  onPageFinished: (finish) {
                                                    setState(() {
                                                      isLoading = true;
                                                    });
                                                    // setState(() {
                                                    //   isLoaded = false;
                                                    // });
                                                  },
                                                ),
                                        ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 240,
                                          width: 160,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.red,
                                          ),
                                          child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              imageUrl:
                                                  "${popularBooks[index].cover}"
                                              // 'https://w7.pngwing.com/pngs/190/293/png-transparent-red-book-book-red-book-free-rectangle-orange-material-thumbnail.png',
                                              ),
                                        ),
                                        Container(
                                          height: 200,
                                          width: 240,
                                          color: Colors.black,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "TITLE: ${popularBooks[index].name}",
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "BOOK_ID: ${popularBooks[index].book_id}",
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "N0: ${popularBooks[index].position}",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 25),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),

                                                Container(
                                                  color: Colors.grey,
                                                  height: 50,
                                                  child: RatingBar.builder(
                                                      updateOnDrag: true,
                                                      allowHalfRating: true,
                                                      direction:
                                                          Axis.horizontal,
                                                      // itemCount: 3,
                                                      itemBuilder:
                                                          (context, _) {
                                                        return const Icon(
                                                          Icons.star,
                                                          color: Colors.amber,
                                                        );
                                                      },
                                                      onRatingUpdate: (rating) {
                                                        setState(() {
                                                          Text(
                                                              "${popularBooks[index].rating}");
                                                        });
                                                      }),
                                                ),
                                                // Text(
                                                //   "Rating: $rating",
                                                //   style: TextStyle(
                                                //       color: Colors.white),
                                                // )

                                                // Padding(
                                                //   padding:
                                                //       const EdgeInsets.all(5.0),
                                                //   child: Row(
                                                //     children: [
                                                //       Icon(
                                                //         Icons.star,
                                                //         color: Colors.white,
                                                //       ),

                                                //       // Icon(
                                                //       //   Icons.star,
                                                //       //   color: Colors.white,
                                                //       // ),
                                                //       // Icon(
                                                //       //   Icons.star,
                                                //       //   color: Colors.white,
                                                //       // ),
                                                //       // Icon(
                                                //       //   Icons.star,
                                                //       //   color: Colors.white,
                                                //       // ),
                                                //       // Icon(
                                                //       //   Icons.star,
                                                //       //   color: Colors.white,
                                                //       // ),
                                                //       Text(
                                                //           '${popularBooks[index].rating}'),

                                                //     ],
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 10,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.red,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 10,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.red,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 10,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.red,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 10,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.red,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 10,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.filter_1,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    'AWARDED BOOKS OF THE YEAR',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                              height: 300,
                              width: 30,
                              color: const Color(0xff2C2C2C),
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: booksAwarded.length,
                                itemBuilder: (BuildContext context, index) =>
                                    Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    // crossAxisAlignment:
                                    // CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 240,
                                        width: 160,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          // color: Colors.red,
                                        ),
                                        child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl:
                                                "${booksAwarded[index].cover}"
                                            // 'https://w7.pngwing.com/pngs/923/976/png-transparent-book-library-book-rectangle-reading-presentation-thumbnail.png',
                                            ),
                                      ),
                                      Container(
                                        height: 150,
                                        width: 176,
                                        color: Colors.black,
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'TITLE: ${booksAwarded[index].name}',
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                'BOOK_ID: ${booksAwarded[index].book_id}',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  )),
            ),
          );
  }
}
