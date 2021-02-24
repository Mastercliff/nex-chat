import 'package:flutter/material.dart';
import 'package:nex_chat/app/views/bottom_bar/bottom_bar.view.dart';
import 'package:nex_chat/app/views/bottom_bar/chats/into.view.dart';
import 'package:nex_chat/app/views/login/login.view.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nex',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/login' : (context) => LoginView(),
        '/bottomBar' : (context) => BottomBarView(),
        '/chatInto' : (context) => ChatIntoView()
      },
      initialRoute: '/login',
    );
  }
}

