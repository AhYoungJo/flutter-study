import 'package:flutter/material.dart';

class ListViewDaon extends StatefulWidget {
  const ListViewDaon({super.key});

  @override
  State<ListViewDaon> createState() => _ListViewDaonState();
}

class _ListViewDaonState extends State<ListViewDaon> {
  // List<String> names = [
  //   "아무개",
  //   "똥개",
  //   "홍길동",
  //   "아무개",
  //   "똥개",
  //   "홍길동",
  //   "아무개",
  //   "똥개",
  //   "홍길동",
  //   "아무개",
  //   "똥개",
  //   "홍길동",
  //   "아무개",
  //   "똥개",
  //   "홍길동",
  //   "아무개",
  //   "똥개",
  //   "홍길동",
  //   "아무개",
  //   "똥개",
  //   "홍길동",
  //   "아무개",
  //   "똥개",
  //   "홍길동",
  //   "아무개",
  //   "똥개",
  //   "홍길동",
  //   "아무개",
  //   "똥개",
  //   "홍길동",
  //   "아무개",
  //   "똥개",
  //   "홍길동",
  //   "아무개",
  //   "똥개",
  //   "홍길동",
  //   "아무개",
  //   "똥개",
  //   "홍길동",
  //   "아무개",
  //   "똥개",
  //   "홍길동",
  //   "아무개",
  //   "똥개",
  //   "홍길동",
  //   "아무개",
  //   "똥개",
  //   "홍길동",
  //   "아무개",
  //   "똥개",
  //   "홍길동",
  //   "아무개",
  //   "똥개",
  //   "홍길동",
  //   "아무개",
  //   "똥개",
  //   "홍길동",
  //   "아무개",
  //   "똥개",
  //   "홍길동",
  //   "아무개",
  //   "똥개",
  //   "홍길동",
  //   "아무개",
  //   "똥개",
  //   "홍길동",
  //   "아무개",
  //   "똥개",
  //   "홍길동",
  //   "아무개",
  //   "똥개",
  //   "홍길동",
  // ];

  List<Person> members = [
    Person(name: '김', age: 29, phone: '010-0000-0023'),
    Person(name: '이', age: 29, phone: '010-0000-1233'),
    Person(name: '박', age: 29, phone: '010-0000-2938'),
    Person(name: '조', age: 29, phone: '010-0000-2342'),
    Person(name: '우', age: 29, phone: '010-0000-3959'),
    Person(name: '금', age: 29, phone: '010-0000-0023'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      //ListView 프로퍼티 seperated는 구분을 주고 싶을 때
      body: ListView.builder(
        //설정해준 갯수만큼 출력
        itemCount: members.length,
        // separatorBuilder:(context,index){
        //   // Color divideColor = Colors.blue;
        //   // return Container(height: 2, color: divideColor);
        //   return Divider();
        // },
        itemBuilder: (context, index) {
          Person member = members[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(16)),
              // color: Colors.yellow,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Row(
                children: [
                  Text(
                    member.name,
                    style: TextStyle(fontSize: 24),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Person {
  String name;
  int age;
  String phone;

  Person({required this.name, required this.age, required this.phone});
}
