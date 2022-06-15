import 'package:flutter/material.dart';
import 'package:my_book_app/utils/colors.dart';
import 'package:my_book_app/views/detail_book_page.dart';
import 'package:my_book_app/views/home_view.dart';
import 'package:my_book_app/widget/appbottomnavigationbar.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int homeSelectedIndex = 0;

  changeSelectedIndex(index) {
    setState(() {
      homeSelectedIndex = index;
    });
  }

  List screen = [
    const HomeView(),
    // const BookDetailedPage(),
    // const HomeView(),
    // Container(
    //   color: Colors.black,
    // // ),
    // Container(
    //   color: Colors.green,
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // backgroundColor: Color(0x2C2C2C),
        scaffoldBackgroundColor: const Color(0xff2C2C2C),
        primarySwatch: kPrimaryColor,
      ),
      home: Scaffold(
        body: screen[homeSelectedIndex],
        // bottomNavigationBar: AppBottomNavigationBar(
        //   selectedIndex: homeSelectedIndex,
        //   onTap: changeSelectedIndex,
        // ),
      ),
    );
  }
}
