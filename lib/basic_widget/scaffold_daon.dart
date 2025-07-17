import 'package:flutter/material.dart';

class ScaffoldDaon extends StatelessWidget {
  const ScaffoldDaon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('제목'),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.bookmark_outline)),
        ],
      ),
      body: Text('내용'),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),),
    );
  }
}
