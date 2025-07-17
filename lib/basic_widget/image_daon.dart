import 'package:flutter/material.dart';


class image_daon extends StatelessWidget {
  const image_daon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(
            'http://animal.memozee.com/ArchHAN01/1097568279.jpg',
            width: 100,
          ),
          Image.asset('image_asset/koala.jpg'),
        ],
      ),
    );
  }
}
