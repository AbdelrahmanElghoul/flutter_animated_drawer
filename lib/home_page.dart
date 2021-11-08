import 'package:dragable_drawer/home_drawer.dart';
import 'package:dragable_drawer/home_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double offset = 0;
  double maxWidth = 0;
  double pageHeight(double height) => ((offset / maxWidth) * height) * .075;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    maxWidth = size.width * .5;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 150),
              top: pageHeight(size.height),
              bottom: pageHeight(size.height),
              left: offset,
              right: offset * -1,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onHorizontalDragUpdate: onPageDragUpdate,
                onHorizontalDragEnd: onHorizontalDragEnd,
                child: HomeTab(
                  openDrawer: () => setState(
                    () => offset = offset == maxWidth ? 0 : maxWidth,
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 150),
              top: 0,
              bottom: 0,
              left: -maxWidth + offset,
              width: maxWidth,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onHorizontalDragUpdate: onDrawerDragUpdate,
                onHorizontalDragEnd: onHorizontalDragEnd,
                child: const HomeDrawer(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onHorizontalDragEnd(DragEndDetails drag) {
    if (offset > maxWidth * .6) {
      offset = maxWidth;
    } else {
      offset = 0;
    }

    setState(() {});
  }

  void onDrawerDragUpdate(DragUpdateDetails drag) {
    offset = drag.localPosition.dx;
    if (offset > maxWidth) offset = maxWidth;
    if (offset < 20) offset = 0;
    setState(() {});
  }

  void onPageDragUpdate(DragUpdateDetails drag) {
    if (offset == 0) return;
    offset = drag.localPosition.dx;
    if (offset > maxWidth) offset = maxWidth;
    if (offset < 20) offset = 0;
    setState(() {});
  }
}
