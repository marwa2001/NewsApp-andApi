import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String? url ;
  WebViewScreen(this.url);

  @override
  State<WebViewScreen> createState() => _State();
}

class _State extends State<WebViewScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    // Initialize the controller with the initial URL

    controller = WebViewController()
      ..loadRequest(Uri.parse(widget.url!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: controller),

    );
  }
}
