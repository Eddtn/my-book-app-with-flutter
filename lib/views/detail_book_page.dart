import 'package:flutter/material.dart';

class BookDetailedPage extends StatelessWidget {
  const BookDetailedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ),
              Positioned(
                  bottom: -10,
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.green,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
