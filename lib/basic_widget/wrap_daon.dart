import 'package:flutter/material.dart';

class wrap_daon extends StatelessWidget {
  const wrap_daon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Wrap(
        spacing: 24,
        runSpacing: 10,
        children: [
          Text('안녕하세요'),
          Chip(label: Text('Chip 1')),
          ElevatedButton(onPressed: () {}, child: Text('ElevatedButton')),
          OutlinedButton(onPressed: () {}, child: Text('OutlinedButton')),
          TextButton(onPressed: () {}, child: Text('TextButton')),
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          Switch(value: true, onChanged: (v){}),
        ],
      ),
    );
  }
}
