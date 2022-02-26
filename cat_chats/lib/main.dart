import 'package:cat_chats/Auth.dart';
import 'package:cat_chats/MainPage.dart';
import 'package:cat_chats/Utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ViewLoader());
}

class ViewLoader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ViewLoaderState();
  }
}

final navigatorKey = GlobalKey<NavigatorState>();

class _ViewLoaderState extends State<ViewLoader> {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('You have an error! ${snapshot.error.toString()}');
            return const Text('Something went wrong!');
          } else if (snapshot.hasData) {
            return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    return const HomePage();
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Something went wrong!'));
                  } else {
                    return const Auth();
                  }
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
