import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'board_item.dart';

class EditBoardDaon extends StatefulWidget {
  const EditBoardDaon({super.key});

  @override
  State<EditBoardDaon> createState() => _EditBoardDaonState();
}

class _EditBoardDaonState extends State<EditBoardDaon> {
  final _fbkey = GlobalKey<FormBuilderState>();
  late BoardItem item;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    item = Get.arguments;

    _fbkey.currentState?.fields['title']?.didChange(item.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: FormBuilder(
            key: _fbkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FormBuilderTextField(
                  name: 'title',
                  initialValue: item.title,
                  decoration: InputDecoration(
                    labelText: '제목',
                    hintText: '제목을 입력해주세여',
                    border: OutlineInputBorder(),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: '필수 입력사항입니다.'),
                    FormBuilderValidators.minLength(3,
                        errorText: '세 글자 이상 입력해주세요')
                  ]),
                ),
                SizedBox(height: 8),
                FormBuilderTextField(
                  name: 'writer',
                  initialValue: item.writer,
                  decoration: InputDecoration(
                    labelText: '작성자',
                    hintText: '작성자를 입력해주세요',
                    border: OutlineInputBorder(),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: '필수 입력사항입니다.'),
                  ]),
                ),
                SizedBox(height: 8),
                Expanded(
                  child: FormBuilderTextField(
                    name: 'content',
                    initialValue: item.content,
                    expands: true,
                    // minLines: 3,
                    // maxLines: 10,
                    maxLines: null,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      labelText: '내용',
                      hintText: '내용을 입력해주세요',
                      border: OutlineInputBorder(),
                    ),

                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: '필수 입력사항입니다.'),
                      FormBuilderValidators.minLength(5,
                          errorText: '다섯 글자 이상 입력해주세요')
                    ]),
                  ),
                ),
                SizedBox(height: 8),
                SafeArea(
                    child: ElevatedButton(
                        onPressed: () {
                          _fbkey.currentState?.saveAndValidate();

                          String title = _fbkey.currentState?.value['title'];
                          String writer = _fbkey.currentState?.value['writer'];
                          String content =
                              _fbkey.currentState?.value['content'];

                          // print('title: $title, writer: $writer, contentL $content');

                          item = BoardItem(
                              no: item.no,
                              title: title,
                              content: content,
                              writer: writer);

                          Get.back(result: item);
                        },
                        child: Text('수정하기')))
              ],
            ),
          ),
        ));
  }
}
