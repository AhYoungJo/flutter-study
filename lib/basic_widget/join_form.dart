import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class JoinForm extends StatelessWidget {
  const JoinForm(
      {super.key,
      required this.caption,
      this.hintText = '입력하세요.',
      this.minLines = 1,
      this.maxLines = 1});

  final String caption;
  final String hintText;
  final int minLines;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
        width: 100,
        child: Text(caption),
      ),
      Expanded(
        child: FormBuilderTextField(
          name: 'name',
          minLines: minLines,
          maxLines: maxLines,
          decoration:
              InputDecoration(hintText: hintText, border: OutlineInputBorder()),
        ),
      )
    ]);
  }
}
