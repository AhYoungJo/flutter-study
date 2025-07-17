import 'package:flutter/material.dart';
import 'package:flutter_study/basic_widget/image_daon.dart';
import 'package:flutter_study/stateful_widget/counter_daon.dart';
import 'package:flutter_study/stateful_widget/setstate_daon.dart';
import 'package:get/get.dart';

class BottomNavigationBarDaon extends StatefulWidget {
  const BottomNavigationBarDaon({super.key});

  @override
  State<BottomNavigationBarDaon> createState() =>
      _BottomNavigationBarDaonState();
}

class _BottomNavigationBarDaonState extends State<BottomNavigationBarDaon> {
  int selectedIndex = 0;

  List<Widget> view = [
    CounterDaon(),
    image_daon(),
    SetstateDaon(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: view[selectedIndex],
      // Center(
      //   // children: [
      //   //   Text('BottomNavigtionBarDaon'),
      //   //   ElevatedButton(
      //   //     onPressed: () {},
      //   //     child: Text(''),
      //   //   ),
      //   // ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index){
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
        ],
      ),
    );
  }
}
