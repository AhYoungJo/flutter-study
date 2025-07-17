import 'package:flutter/material.dart';

class container_daon extends StatelessWidget {
  const container_daon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        // color: Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.blue,
          border: Border.all(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(2,2),
            )
          ]
        ),
        width: 168,
        height: 100,
        child: Text('컨테이너'),
      ),
    );
  }
}
