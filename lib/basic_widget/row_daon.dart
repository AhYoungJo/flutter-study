import 'package:flutter/material.dart';

class row_daon extends StatelessWidget {
  const row_daon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('1'),
          Text('2'),
          Text('3'),
        ],
      ),
    );
  }
}
