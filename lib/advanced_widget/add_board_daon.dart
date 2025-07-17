import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_study/advanced_widget/board_item.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class AddBoardDaon extends StatefulWidget {
  const AddBoardDaon({super.key});

  @override
  State<AddBoardDaon> createState() => _AddBoardDaonState();
}

class _AddBoardDaonState extends State<AddBoardDaon> {
  final _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('게시물 등록'),
        actions: [
          IconButton(
            onPressed: () {
              _fbKey.currentState?.reset();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: FormBuilder(
          key: _fbKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FormBuilderTextField(
                name: 'title',
                decoration: InputDecoration(
                  labelText: '제목',
                  hintText: '제목을 입력하세요.',
                  border: OutlineInputBorder(),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: '필수 입력사항입니다.'),
                  FormBuilderValidators.minLength(3,
                      errorText: '세글자 이상 입력하세요.'),
                ]),
              ),
              SizedBox(height: 8),
              FormBuilderTextField(
                name: 'writer',
                decoration: InputDecoration(
                  labelText: '작성자',
                  hintText: '이름을 입력하세요.',
                  border: OutlineInputBorder(),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: '필수 입력사항입니다.'),
                  FormBuilderValidators.minLength(3,
                      errorText: '세글자 이상 입력하세요.'),
                ]),
              ),
              SizedBox(height: 8),
              Expanded(
                child: FormBuilderTextField(
                  name: 'content',
                  maxLines: null,
                  // expands에 true를 주려면 꼭 줘야하는 값
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    labelText: '내용',
                    hintText: '내용을 입력하세요.',
                    border: OutlineInputBorder(),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: '필수 입력사항입니다.'),
                    FormBuilderValidators.minLength(3,
                        errorText: '세글자 이상 입력하세요.'),
                  ]),
                ),
              ),
              SizedBox(height: 8),
              SafeArea(
                child: ElevatedButton(
                    onPressed: () {
                      _fbKey.currentState
                          ?.saveAndValidate(); //저장과 유효성검사를 동시에 한다.
                      String title = _fbKey.currentState?.value['title'];
                      String writer = _fbKey.currentState?.value['writer'];
                      String content = _fbKey.currentState?.value['content'];

                      // print(
                      //     'title: $title, writer: $writer, contnet: $content');
                      Get.back(
                          result: BoardItem(
                        no: 0,
                        title: title,
                        content: content,
                        writer: writer,
                      ));
                    },
                    child: Text('등록하기')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
