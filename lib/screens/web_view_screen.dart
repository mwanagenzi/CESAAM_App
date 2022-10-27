import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  String webViewTitle;
  String webViewUrl;
  WebViewScreen({
    Key? key,
    required this.webViewTitle,
    required this.webViewUrl,
  }) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  int _loadingPercentage = 0;
  final _controller = Completer<WebViewController>();

  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.webViewTitle,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          NavigationControls(
            controller: _controller,
          )
        ],
      ),
      body: Stack(
        children: [
          WebView(
            onWebViewCreated: (webViewController) {
              _controller.complete(webViewController);
            },
            initialUrl: widget.webViewUrl, 
            onPageStarted: (url) {
              setState(() {
                _loadingPercentage = 0;
              });
            },
            onProgress: (progress) {
              setState(() {
                _loadingPercentage = progress;
              });
            },
            onPageFinished: (url) {
              setState(() {
                _loadingPercentage = 100;
              });
            },
          ),
          if (_loadingPercentage < 100)
            Center(
              heightFactor: 100,
              widthFactor: 100,
              child: CircularProgressIndicator(
                value: _loadingPercentage / 100.0,
              ),
            ),
        ],
      ),
    );
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final Completer<WebViewController> controller;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
        future: controller.future,
        builder: (context, snapshot) {
          final WebViewController? controller = snapshot.data;
          if (snapshot.connectionState != ConnectionState.done ||
              controller == null) {
            return Row(
              children: const [
                Icon(Icons.arrow_back_ios),
                Icon(Icons.arrow_forward_ios),
                Icon(Icons.replay),
              ],
            );
          } else {
            return Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () async {
                    if (await controller.canGoBack()) {
                      await controller.goBack();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          showWebViewSnackBar(context, 'No back history item'));
                      return;
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () async {
                    if (await controller.canGoForward()) {
                      await controller.goForward();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          showWebViewSnackBar(
                              context, 'No forward history item'));
                      return;
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.replay),
                  onPressed: () {
                    controller.reload();
                  },
                ),
              ],
            );
          }
        });
  }
}

SnackBar showWebViewSnackBar(BuildContext context, String content) => SnackBar(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
      duration: const Duration(seconds: 3),
      elevation: 2,
      behavior: SnackBarBehavior.floating,
      content: Text(content),
    );
