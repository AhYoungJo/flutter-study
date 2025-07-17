import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_study/basic_widget/join_form.dart';

class sized_box_daon extends StatelessWidget {
  const sized_box_daon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(children: [
          Row(children: [
            SizedBox(
              width: 100,
              child: Text('beat box'),
            ),
            Expanded(
              child: FormBuilderTextField(
                name: 'name',
                decoration: InputDecoration(hintText: '이름을 입력하세요.'),
              ),
            )
          ]),
          SizedBox(height: 14,), //br태그 같은 기능
          Row(children: [
            SizedBox(
              width: 100,
              child: Text('beat box'),
            ),
            Expanded(
              child: FormBuilderTextField(
                name: 'name',
                decoration: InputDecoration(hintText: '이름을 입력하세요.'),
              ),
            )
          ]),
          SizedBox(height: 14,),
          Row(children: [
            SizedBox(
              width: 100,
              child: Text('자기소개'),
            ),
            Expanded(
              child: FormBuilderTextField(
                name: 'name',
                minLines: 5,
                maxLines: 8,
                decoration: InputDecoration(
                    hintText: '자신을 멋지게 소개해주세요.', border: OutlineInputBorder()),
              ),
            )
          ]),
          SizedBox(height: 14,),
          JoinForm(caption: '이메일', minLines: 3, maxLines: 10,),
        ]),
      ),
    );
  }
}

//command + b : 위젯으로 바로 넘어가는 단축키
//command + option + '-' : 코드 접기
//command + option + l : 코드 자동 정렬
//command + option + 방향키 : 코드 이동
