import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  final VoidCallback? openDrawer;
  const HomeTab({this.openDrawer, Key? key}) : super(key: key);

  //

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Home",
            style: TextStyle(color: Colors.grey),
          ),
          leading: IconButton(
            onPressed: openDrawer,
            icon: const Icon(
              Icons.dehaze,
              color: Colors.grey,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        // backgroundColor: Colors.red,
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dehaze,
              ),
              label: "More",
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [
              Text(
                  "123123123131123123123131123123123131123123123131123123123131"),
            ],
          ),
        ),
      ),
    );
  }
}
