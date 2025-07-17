import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/basic_widget/container_daon.dart';
import 'package:flutter_study/basic_widget/helloworld_daon.dart';
import 'package:flutter_study/basic_widget/row_daon.dart';
import 'package:flutter_study/basic_widget/scaffold_daon.dart';
import 'package:flutter_study/basic_widget/single_child_scroll_view_doan.dart';
import 'package:flutter_study/basic_widget/sized_box_daon.dart';
import 'package:flutter_study/basic_widget/wrap_daon.dart';
import 'package:flutter_study/home_daon.dart';
import 'package:flutter_study/screen/home_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());

  int i = 1;
  print(i);
  String name = '조아영';
  print(name);

  double d = 1.0;
  print(d);
  String result = sum(1,4);
  print(result);
  printNameCard('조아영', 30, 10000);

  print('---------------------------------------------------');
  List<String> names = ['조아영', '이아영', '김아영'];
  print(names[0]);

  names.add('강아영');
  names.removeAt(1);
  for(int i = 0; i < names.length; i++){
    print(names[i]);
  }

  print('---------------------------------------------------');
  var a = 1;
  print(a);
  var b = '일';
  print(b);
  // a = '1'
  dynamic d1 = 1;
  d1 = '1';
  print('---------------------------------------------------');

  Board board = Board('코딩수업', '오늘은 그랬어. 더 그랬어..', '나야나', 1, false);

  print(board.title);
  print(board.content);
  print(board.writer);
  print(board.viewCount);
  print(board.isNotice);

  board.printBoardInfo();

  print('========================================= board.toString()');
  print(board.toString());
  print(i); // 자동으로 toString()이 호출된다.
  print(i.toString());

  // 모든 타입이든 Object 타입을 상속받는다.
  // 그래서 모든 타입은 toString()을 가지고 있다.
  // Object 클래스의 toString()은 객체의 타입을 출력한다.

  // 붕어빵 만드는 틀 : 클래스
  // Board 클래스는 Board타입을 만드는 붕어빵 틀 이다.
  // board는 Board타입의 붕어빵이다. (객체, 인스턴스)


  // 게시판을 만들기 위해서는 여러개의 Board가 필요하다.
  // 그래서 어떤 타입이 필요할까?
  // List<Board> : Board타입의 List가 필요하다.

  Board b1 = Board('코딩수업1', '오늘은 그랬어. 더 그랬어..', '나야나', 1, false);

  // List<Board> boards = [
  //   Board('코딩수업2', '오늘은 그랬어. 더 그랬어..', '나야나', 1, false),
  //   Board('코딩수업3', '오늘은 그랬어. 더 그랬어..', '나야나', 1, false),
  //   b1,
  //   Board('코딩수업4', '오늘은 그랬어. 더 그랬어..', '나야나', 1, false),
  // ];
  var boards = [
    Board('코딩수업2', '오늘은 그랬어. 더 그랬어..', '나야나', 1, false),
    Board('코딩수업3', '오늘은 그랬어. 더 그랬어..', '나야나', 1, false),
    b1,
    Board('코딩수업4', '오늘은 그랬어. 더 그랬어..', '나야나', 1, false),
  ];

  for(int i = 0; i < boards.length; i++) {
    print(boards[i].toString());
  }

  //print는 콘솔에 출려깃켜주는 메서드
  //어떤 타입이든 문자로 변환시켜주는 메서드가 내장되어 있다.
  //Object의 타입은 toString은 객체의 타입을 출력시켜주는 역할을 한다.
  //모든 타입은 Object를 상속받는다


}

void printNameCard(String name, int age, double weight){
  print('이름: $name, 나이: $age, 몸무게: ${weight}kg');
}

  String sum(int a, int b) {
    switch(a+b) {
      case 1:
        return '1이다';
      case 2:
        return '2이다';
      case 3:
        return '3이다';
      case 4:
        return '4이다';
      case 5:
        return '5이다';
      case 6:
        return '6이다';
      case 7:
        return '7이다';
      case 8:
        return '8이다';
      default:
        return '모르겠다';
    }
  }


  // 클라스 구성: 멤버들 (멤버 메서드, 멤버 변수)
class Board {
  String? title;
  String? content;
  String? writer;
  int? viewCount;
  bool? isNotice;

  // 생성자, Constructor
  // Board(this.title, this.content, this.writer, this.viewCount, this.isNotice);
  Board(String title, String content, String writer, int viewCount, bool isNotice) {
    this.title = title;
    this.content = content;
    this.writer = writer;
    this.viewCount = viewCount;
    this.isNotice = isNotice;
  }

  void printBoardInfo() {
    print('제목 : $title, 내용 : $content, 작성자 : $writer, 조회수 : $viewCount, 공지사항 : $isNotice');
  }
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  //위젯: 화면을 구현하는 요소, UI를 갖고 있는 클래스
  //StatelessWidget: 상태가 있는 위젯
  //StatefulWidget: 상태가 있는 위젯

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return GetMaterialApp(
    //   title: '앱 제목',
    //   debugShowCheckedModeBanner: false,
    //   // home: home_daon(),
    //   home: HomeScreen(),
    // );
    return ProviderScope(
      // home: home_daon(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }

  // void goScaffold(){}
}

//매개변수에 중괄호로 묶어주면 값이 있어도 되고 없어도 된다는 뜻으로 간주
int sum2({int first = 0, int second = 0, int third =0, int fourth =0}){
  return first + second + third + fourth;
}