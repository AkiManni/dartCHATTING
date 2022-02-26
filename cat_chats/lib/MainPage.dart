import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:localstorage/localstorage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WebViewLoad();
}

final punainen = Container(
    width: 360,
    height: 250,
    child: const WebView(
      initialUrl: 'https://catschats.netlify.app/',
      javascriptMode: JavascriptMode.unrestricted,
    ));

final sininen = Container(
    width: 360,
    height: 250,
    child: const WebView(
      initialUrl: 'https://condescending-snyder-eabbb5.netlify.app',
      javascriptMode: JavascriptMode.unrestricted,
    ));

final lista = [punainen, sininen];

final listanakyma = ListView(scrollDirection: Axis.horizontal, children: lista);

class _WebViewLoad extends State<HomePage> {
  final _user = FirebaseAuth.instance.currentUser!;
  final LocalStorage storage = LocalStorage('userInfo');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              listanakyma,
              // const SizedBox(height: 50),
              // Text(
              //   'Signed in as',
              //   style: TextStyle(fontSize: 16),
              // ),
              // const SizedBox(height: 8),
              // Text(
              //   storage.getItem('userName') ?? _user.displayName,
              //   style: const TextStyle(fontSize: 20),
              // ),
              // const SizedBox(height: 10),
              // ElevatedButton.icon(
              //   style: ElevatedButton.styleFrom(
              //     fixedSize: Size.infinite,
              //   ),
              //   onPressed: () => {
              //     FirebaseAuth.instance.signOut(),
              //     storage.clear(),
              //   },
              //   icon: const Icon(Icons.arrow_back, size: 32),
              //   label: const Text(
              //     'Sign out',
              //     style: TextStyle(fontSize: 24),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
