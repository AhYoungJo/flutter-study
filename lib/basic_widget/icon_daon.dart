import 'package:flutter/material.dart';

class icon_daon extends StatelessWidget {
  const icon_daon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: GestureDetector(
              onTap: () {
                print("Icon Clicked");
              },
              child: Icon(
                  Icons.alarm,
                  color: Colors.brown,
                  size: 64,
              )),
        ));
  }
}
