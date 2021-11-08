import 'package:flutter/material.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrain) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: kToolbarHeight,
          horizontal: 10,
        ),
        child: Column(
          children: [
            Container(
              height: constrain.maxWidth * .3,
              width: constrain.maxWidth * .3,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 30,
                itemBuilder: (_, i) {
                  return Column(
                    children: [
                      Text("item $i"),
                      const Divider(),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
