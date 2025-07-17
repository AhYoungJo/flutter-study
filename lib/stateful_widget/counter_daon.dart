import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterDaon extends StatefulWidget {
  const CounterDaon({super.key});

  @override
  State<CounterDaon> createState() => _CounterDaonState();
}

class _CounterDaonState extends State<CounterDaon> {
  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.brown,
          height: Get.size.height,
          child: Row(
            verticalDirection: VerticalDirection.down,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      num++;
                    },
                  );
                },
                child: Text('+'),
              ),
              Text('$num'),
              ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      num--;
                    },
                  );
                },
                child: Text('-'),
              )
            ],
          ),
        ));
  }
}
