import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/advanced_widget/board_item.dart';
import 'package:flutter_study/advanced_widget/edit_board_daon.dart';
import 'package:flutter_study/advanced_widget/edit_board_daon_nullable.dart';
import 'package:flutter_study/main.dart';
import 'package:get/get.dart';

typedef BoardCallBack = void Function(BoardItem);

class ViewBoardDaon extends StatefulWidget {
  ViewBoardDaon({super.key, required this.onChangedValue});

  BoardCallBack onChangedValue;

  @override
  State<ViewBoardDaon> createState() => _ViewBoardDaonState();
}

class _ViewBoardDaonState extends State<ViewBoardDaon> {
  // late 키워드를 써서 item 변수를 선언하면 내용을 초기화할 수 있다.
  late BoardItem item;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //형 변환 as
    item = Get.arguments as BoardItem;
    // widget.onChangedValue(item);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        actions: [
          IconButton(onPressed: () async {
            var result = await Get.to(()=>EditBoardDaonNullable(), arguments: item);
            if(result is BoardItem){
              setState(() {
                item = result;
              });
              widget.onChangedValue(item);
            }
          }, icon: Icon(Icons.edit_document))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('제목: ${item.writer}'),
          Divider(),
          Text('내용: \n ${item.content}'),
        ],
      )
    );
  }
}
