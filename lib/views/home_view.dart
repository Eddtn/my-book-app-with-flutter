import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:my_book_app/models/book_model.dart';
import 'package:my_book_app/service/book_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BooksModel> books = [];

  bool isLoaded = false;

  @override
  void initState() {
    // Future.delayed(Duration(seconds: 5), (() => getData()));

    super.initState();
    getData();
  }

  getData() async {
    final books = await BookService();
    if (books != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      replacement: const Center(child: CircularProgressIndicator()),
      child: Scaffold(
        // backgroundColor: Colors.grey,
        body: Padding(
            padding: const EdgeInsets.all(4.0),
            child: FutureBuilder(
              builder: (context, response) {
                return CustomScrollView(
                  slivers: [
                    const SliverAppBar(
                      actions: [
                        Icon(
                          Icons.search,
                          size: 40,
                        ),
                      ],
                      title: Text('My Book App with Flutter'),
                      leading: Icon(Icons.menu),
                      backgroundColor: Colors.blue,
                      floating: true,
                      expandedHeight: 80,
                      pinned: true,
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        height: 300,
                        width: 20,
                        color: const Color(0xff2C2C2C),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: books.length,
                          itemBuilder: (BuildContext context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    height: 350,
                                    width: 190,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xffF78376),
                                    ),
                                    child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: books[index].cover),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                      height: 70,
                                      width: 190,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              // AppText.heading1R('book title'),
                                              Text(
                                                books[index].name,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 90,
                                          ),
                                          Text(
                                            books[index].book_id,
                                            style:
                                                TextStyle(color: Colors.white),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          itemBuilder: (BuildContext context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 70,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.blue),
                                borderRadius: BorderRadius.circular(20),
                                // color: Colors.red,
                              ),
                              child: const Center(
                                child: Text(
                                  'literature',
                                  style: TextStyle(
                                      color: Color(0xff2C4855), fontSize: 15),
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
                          itemBuilder: (BuildContext context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 70,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.blue),
                                borderRadius: BorderRadius.circular(20),
                                // color: Colors.red,
                              ),
                              child: const Center(
                                child: Text(
                                  'literature',
                                  style: TextStyle(
                                      color: Color(0xff2C4855), fontSize: 15),
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
                              'FAVOURITE',
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
                          itemCount: 4,
                          itemBuilder: (BuildContext context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 240,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.red,
                                  ),
                                  child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          'https://w7.pngwing.com/pngs/190/293/png-transparent-red-book-book-red-book-free-rectangle-orange-material-thumbnail.png'),
                                ),
                                Container(
                                  height: 150,
                                  width: 190,
                                  color: Colors.black,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'book title',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        const SizedBox(
                                          height: 50,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: const [
                                              Icon(
                                                Icons.star,
                                                color: Colors.white,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.white,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.white,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.white,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
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
                              'MOST VIEWED',
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
                          itemCount: 4,
                          itemBuilder: (BuildContext context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 240,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.red,
                                  ),
                                  child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          'https://w7.pngwing.com/pngs/923/976/png-transparent-book-library-book-rectangle-reading-presentation-thumbnail.png'),
                                ),
                                Container(
                                  height: 150,
                                  width: 175,
                                  color: Colors.black,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'book title',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        const SizedBox(
                                          height: 50,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: const [
                                              Icon(
                                                Icons.star,
                                                color: Colors.white,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.white,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.white,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.white,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
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
        // Visibility(
        //   visible: isLoaded,
        //   child:
        //   replacement: const Center(
        //     child: CircularProgressIndicator(),
        //   ),
        // ),
      ),
    );
  }
}
