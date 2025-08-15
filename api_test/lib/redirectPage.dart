import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RedirectPage extends StatefulWidget {
  const RedirectPage({Key? key}) : super(key: key);

  @override
  State<RedirectPage> createState() => _RedirectPageState();
}

class _RedirectPageState extends State<RedirectPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..loadRequest(Uri.parse('https://anurupdatta.github.io/fixera_api_test_webpage/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phone Input WebView')),
      body: WebViewWidget(controller: _controller),
    );
  }
}