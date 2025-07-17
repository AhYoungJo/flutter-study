import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'add_board_daon.dart';
import 'board_item.dart';
import 'view_board_daon.dart';

class RollBackDaon extends StatefulWidget {
  const RollBackDaon({super.key});

  @override
  State<RollBackDaon> createState() => _RollBackDaonState();
}

class _RollBackDaonState extends State<RollBackDaon> {
  List<BoardItem>? items;

  @override
  void initState() {
    super.initState();

    getData();
  }

  void getData() async {
    // 500ms 지연
    await Future.delayed(Duration(milliseconds: 1500));

    // 임시 데이터 생성
    BoardItem item1 = BoardItem(
        no: 1, title: '첫 번째 게시글', content: '첫 번째 게시글 내용입니다.', writer: '작성자1');
    BoardItem item2 = BoardItem(
        no: 2, title: '두 번째 게시글', content: '두 번째 게시글 내용입니다.', writer: '작성자2');
    BoardItem item3 = BoardItem(
        no: 3, title: '세 번째 게시글', content: '세 번째 게시글 내용입니다.', writer: '작성자3');
    BoardItem item4 = BoardItem(
        no: 4, title: '네 번째 게시글', content: '네 번째 게시글 내용입니다.', writer: '작성자4');
    BoardItem item5 = BoardItem(
        no: 5, title: '다섯 번째 게시글', content: '다섯 번째 게시글 내용입니다.', writer: '작성자5');

    List<BoardItem> dbItems = [];

    dbItems.add(item1);
    dbItems.add(item2);
    dbItems.add(item3);
    dbItems.add(item4);
    dbItems.add(item5);

    setState(() {
      items = dbItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('총 ${items?.length ?? 0}개의 게시물'),
        elevation: 10,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () async {
              // Get.to()는 화면을 이동하는 함수
              // AddBoard 게시물 등록 화면으로 이동
              // 등록하기를 누르면 AddBoardDaon에서 Get.back(result: ...)을 통해서 결과를 반환
              var result = await Get.to(() => AddBoardDaon());

              if (result is BoardItem) {
                // 변수값이 UI에 반영되도록 setState() 함수 호출
                setState(() {
                  items?.add(result);
                });
              }
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: items == null ? Center(child: CircularProgressIndicator()) :

      items?.length == 0 ? Center(child: Text('게시물이 없습니다.')) :

      LiquidPullToRefresh(
        onRefresh: () async {
          getData();
        },
        child: ListView.builder(
          itemCount: items?.length ?? 0,
          itemBuilder: (context, index) {
            // 어떤 모양인지를 정의, 약간 반복문
            return Dismissible(
              key: Key("${items?[index].no}"),
              confirmDismiss: (direction) async {
                if (direction == DismissDirection.endToStart) {
                  var result = await showOkCancelAlertDialog(
                    context: context,
                    message: '삭제 하시겠습니까?',
                    okLabel: '당장지워',
                    cancelLabel: '오~노!',
                  );

                  if (result == OkCancelResult.ok) {
                    setState(() {
                      items?.removeAt(index);
                    });
                    return true;
                  }
                }

                return false;
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerLeft,
                child: Icon(Icons.delete, color: Colors.white),
              ),
              secondaryBackground: Container(
                color: Colors.blue,
                alignment: Alignment.centerRight,
                child: Icon(Icons.delete, color: Colors.white),
              ),
              child: GestureDetector(
                onTap: () {
                  var item = items?[index];

                  Get.to(
                          () =>
                          ViewBoardDaon(
                            onChangedValue: onChangedBoard,
                          ),
                      arguments: item);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 4),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(items?[index].title ?? '-'),
                      subtitle: Text(items?[index].content ?? '-'),
                      trailing: Text(items?[index].writer ?? '-'),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      )
      ,
    );
  }

  onChangedBoard(BoardItem item) {
    print('item 값이 전달 되었습니다.');

    items?.forEach((oldItem) {
      if (oldItem.no == item.no) {
        setState(() {
          var index = items?.indexOf(oldItem) ?? -1;
          items?.insert(index, item);
          items?.remove(oldItem);
        });
      }
    });
  }
}