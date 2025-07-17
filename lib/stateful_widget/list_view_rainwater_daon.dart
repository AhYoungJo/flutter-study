import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/model/minwon_model.dart';
import 'package:get/get.dart';

class ListViewRainwaterDaon extends StatefulWidget {
  const ListViewRainwaterDaon({super.key});

  @override
  State<ListViewRainwaterDaon> createState() => _ListViewRainwaterDaonState();
}

class _ListViewRainwaterDaonState extends State<ListViewRainwaterDaon> {
  MinwonModel? minwon;

  @override
  void initState() {
    super.initState();
    // print('initState가 실행됨');
    getList(1);
  }

  void getList(int page) async {
    String apiUrl = 'https://211.45.175.150:25842/minwon/list/N/${page}/10';

    Dio dio = Dio();
    final reponse = await dio.get(apiUrl);
    // print(reponse);
    if (reponse.statusCode == 200) {
      setState(() {
        minwon = MinwonModel.fromJson(reponse.data);
      });
    } else {
      Get.snackbar('에러', '데이터를 불러오는데 실패했습니다.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('노원구 민원 목록'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'add',
            onPressed: () {
              Get.snackbar("hello", "zzzzz");
            },
          ),
        ],
      ),
      body: minwon == null
          ? CircularProgressIndicator()
          : SafeArea(
              child: Column(
                children: [
                  Text('${minwon?.totalCount} 건의 민원이 있습니다.'),
                  //화면의 남은 공간만큼 차지
                  Expanded(
                    child: ListView.builder(
                        itemCount: minwon?.items?.length ?? 0,
                        itemBuilder: (context, index) {
                          var item = minwon?.items?[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                            child: GestureDetector(
                              onTap: () {
                                Get.snackbar('민원 상세', '${item?.content}');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    // border: Border.all(color: Colors.grey),
                                    // color: Color(0xffe0e0e0),
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.white,
                                        Color(0xffa0a0a0),
                                      ],
                                      //그라디언트 각 컬러가 끝나는 지점
                                      stops: [0.0, 1.0],
                                      //방향
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withAlpha(50),
                                        spreadRadius: 1,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      ),
                                    ]),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${item?.content}'),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: item?.statusName == '완료'
                                            ? Colors.red
                                            : Colors.deepPurple,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 5),
                                      child: Text(
                                        '${item?.statusName}',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text('${item?.rainwaterId}'),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            getList(1);
                          },
                          child: Text('1')),
                      ElevatedButton(
                          onPressed: () {
                            getList(1);
                          },
                          child: Text('1')),
                      ElevatedButton(
                          onPressed: () {
                            getList(1);
                          },
                          child: Text('1')),
                      ElevatedButton(
                          onPressed: () {
                            getList(1);
                          },
                          child: Text('1')),
                      ElevatedButton(
                          onPressed: () {
                            getList(1);
                          },
                          child: Text('1')),
                      ElevatedButton(
                          onPressed: () {
                            getList(1);
                          },
                          child: Text('1')),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
