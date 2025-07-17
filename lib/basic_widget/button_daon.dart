import 'package:flutter/material.dart';

class button_daon extends StatelessWidget {
  const button_daon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                print('button');
              },
              child: Text('Text button')),
          IconButton(
            onPressed: () {
              print('icon button');
            },
            icon: Icon(Icons.store_outlined),
          ),
          OutlinedButton(
            onPressed: () {
              print('outlined button');
            },
            child: Text('outlined button'),
          ),
          ElevatedButton(
            onPressed: () {
              print('elevated button');
            },
            child: Text('elevated button'),
          ),
          Divider(),
          TextButton.icon(
            onPressed: () {
              print('text button icon');
            },
            icon: Icon(Icons.home_outlined),
            label: Text('Text Button Icon'),
          )
        ],
      ),
    );
  }
}
