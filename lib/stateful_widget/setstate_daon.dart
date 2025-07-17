import 'package:flutter/material.dart';

class SetstateDaon extends StatefulWidget {
  const SetstateDaon({super.key});

  @override
  State<SetstateDaon> createState() => _SetstateDaonState();
}

class _SetstateDaonState extends State<SetstateDaon> {
  int a = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('a: $a'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                a++;
              });
            },
            child: Text('INCREAMENT'),
          ),
        ],
      ),
    );
  }
}
