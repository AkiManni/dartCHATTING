import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

final punainen = Container(
    width: 360,
    height: 300,
    child: const WebView(
      initialUrl: 'https://catschats.netlify.app/',
      javascriptMode: JavascriptMode.unrestricted,
    ));

final vihrea = Container(
    width: 360,
    height: 300,
    child: const WebView(
      initialUrl: 'https://vibrant-davinci-e043e7.netlify.app/',
      javascriptMode: JavascriptMode.unrestricted,
    ));

final sininen = Container(
    width: 360,
    height: 300,
    child: const WebView(
      initialUrl: 'https://condescending-snyder-eabbb5.netlify.app',
      javascriptMode: JavascriptMode.unrestricted,
    ));

final lista = [punainen, vihrea, sininen];

final listanakyma = ListView(scrollDirection: Axis.horizontal, children: lista);

class WebViewLoad extends StatefulWidget {
  WebViewLoadUI createState() => WebViewLoadUI();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: WebViewLoad()));
  }
}

class WebViewLoadUI extends State<WebViewLoad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(' ChATS Yläpalkki '),
          toolbarHeight: 30,
        ),
        body: listanakyma);
  }
}
