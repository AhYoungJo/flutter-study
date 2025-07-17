import 'package:flutter/material.dart';
import 'package:flutter_study/advanced_widget/roll_back_daon.dart';
import 'package:flutter_study/advanced_widget/url_launcher_daon.dart';
import 'package:flutter_study/advanced_widget/web_view_daon.dart';
import 'package:flutter_study/basic_widget/button_daon.dart';
import 'package:flutter_study/basic_widget/icon_daon.dart';
import 'package:flutter_study/basic_widget/image_daon.dart';
import 'package:flutter_study/stateful_widget/bottom_navigation_bar_daon.dart';
import 'package:flutter_study/stateful_widget/counter_daon.dart';
import 'package:flutter_study/stateful_widget/list_view_daon.dart';
import 'package:flutter_study/stateful_widget/list_view_rainwater_daon.dart';
import 'package:flutter_study/stateful_widget/setstate_daon.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'basic_widget/container_daon.dart';
import 'basic_widget/helloworld_daon.dart';
import 'basic_widget/row_daon.dart';
import 'basic_widget/scaffold_daon.dart';
import 'basic_widget/single_child_scroll_view_doan.dart';
import 'basic_widget/sized_box_daon.dart';
import 'basic_widget/wrap_daon.dart';

class home_daon extends StatelessWidget {
  const home_daon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Study Flutter')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('1. Basic Widget'),
              ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScaffoldDaon()));
                    Get.to(() => ScaffoldDaon());
                  },
                  child: Text('Scaffold를 알아보자')),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => helloworld_daon());
                  },
                  child: Text('Hello world')),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => container_daon());
                  },
                  child: Text('Container')),
              ElevatedButton(onPressed: null, child: Text('Column')),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => row_daon());
                  },
                  child: Text('Row')),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => single_child_scroll_view_doan());
                  },
                  child: Text('SingleChildScrollView')),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => wrap_daon());
                  },
                  child: Text('Wrap')),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => sized_box_daon());
                  },
                  child: Text("SizedBox")),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => icon_daon());
                  },
                  child: Text('Icon')),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => image_daon());
                  },
                  child: Text('Image')),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => button_daon());
                  },
                  child: Text('Button')),
              ElevatedButton(
                  onPressed: () {
                    //onTab, longTab
                  },
                  child: Text('GestureDetector')),
              ElevatedButton(
                  onPressed: () {
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     content: Text('스낵바'),
                    //     duration: Duration(seconds: 5),
                    //     action: SnackBarAction(
                    //       label: '취소',
                    //       onPressed: () {},
                    //     ),
                    //   ),
                    // );
                    Fluttertoast.showToast(
                      msg: "This is Center Short Toast",
                      toastLength: Toast.LENGTH_SHORT,
                      // gravity: ToastGravity.TOP_RIGHT,
                      // timeInSecForIosWeb: 1,
                      // backgroundColor: Colors.red,
                      // textColor: Colors.white,
                      // fontSize: 16.0
                    );
                    // Get.snackbar('제목', '내용',
                    //     snackPosition: SnackPosition.BOTTOM,
                    //     duration: Duration(milliseconds: 2000),
                    //     backgroundColor: Colors.black,
                    //     colorText: Colors.amber,
                    //     mainButton: TextButton(
                    //       onPressed: () {
                    //         Get.back();
                    //       },
                    //       //child는 위젯이라서 Text 외 다른 위젯들도 올 수 있다!
                    //       child: Text('닫기'),
                    //     ));
                  },
                  child: Text('SnackBar')),
              SizedBox(height: 32),
              Text('2. stateful Widget'),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => SetstateDaon());
                  },
                  child: Text('setState')),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => CounterDaon());
                  },
                  child: Text('Counter(+, -)')),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => BottomNavigationBarDaon());
                  },
                  child: Text('BottomNavigationBar')),
              SizedBox(
                height: 32,
              ),
              Text('3. Advanced (packages/etc)'),
              ElevatedButton(onPressed: (){
                Get.to(()=>UrlLauncherDaon());
              }, child: Text('URL Launcher')),
              ElevatedButton(onPressed: (){
                Get.to(()=>WebViewDaon());
              }, child: Text('WebView')),
              ElevatedButton(
                  onPressed: null, child: Text('Shared Preferences')),
              ElevatedButton(
                  onPressed: null, child: Text('Get Toast, Get SnackBar')),
              ElevatedButton(onPressed: null, child: Text('Get Dialog')),
              ElevatedButton(onPressed: (){
                Get.to(()=>ListViewDaon());
              }, child: Text('ListView')),
              ElevatedButton(onPressed: (){
                Get.to(()=>ListViewRainwaterDaon());
              }, child: Text('ListView_Rainwater')),
              ElevatedButton(onPressed: (){
                Get.to(()=>RollBackDaon());
              }, child: Text('Roll Back')),
              ElevatedButton(onPressed: null, child: Text('Board')),
            ],
          ),
        ),
      ),
    );
  }
}
