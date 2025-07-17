import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

class UrlLauncherDaon extends StatelessWidget {
  const UrlLauncherDaon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              Uri url = Uri.parse('tel-010-9494-9851');
              // await launchUrl(url);
              // var r = await launchUrl(url);
              // print(r);
            },
            child: Text('나에게 전화걸기'),
          ),
          ElevatedButton(
            onPressed: () {
              Uri url = Uri.parse('sms:010-9494-9851');
              // launchUrl(url);
            },
            child: Text('나에게 문자메시지'),
          ),
          ElevatedButton(
            onPressed: () {
              Uri url = Uri.parse('https://www.naver.com');
              // launchUrl(url);
            },
            child: Text('네이버'),
          ),
          ElevatedButton(
            onPressed: () {
              Uri url = Uri.parse('mailto:doubletwosep@gmail.com');
              // launchUrl(url);
            },
            child: Text('email to myself'),
          ),
        ],
      ),
    );
  }
}
