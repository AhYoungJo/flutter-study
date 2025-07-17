import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewDaon extends StatefulWidget {
  const WebViewDaon({super.key});

  @override
  State<WebViewDaon> createState() => _WebViewDaonState();
}

class _WebViewDaonState extends State<WebViewDaon> {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
      ),
    )
    ..loadRequest(Uri.parse('https://www.google.com'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: WebViewWidget(
              controller: controller,
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.loadRequest(
                    Uri.parse('https://naver.com'),
                  );
                },
                child: Text('네이버로 이동'),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.loadRequest(
                    Uri.parse('https://daum.net'),
                  );
                },
                child: Text('다음으로 이동'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
