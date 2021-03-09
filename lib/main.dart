import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nex_chat/app/views/bottom_bar/bottom_bar.view.dart';
import 'package:nex_chat/app/views/bottom_bar/chats/into.view.dart';
import 'package:nex_chat/app/views/bottom_bar/profile/widgets/profile.widgets.dart';
import 'package:nex_chat/app/views/init/splash.view.dart';
import 'package:nex_chat/app/views/login/login.view.dart';
import 'package:nex_chat/styles/colors.dart';

void main() async {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center();
        }
        if (snapshot.hasError) {
          print('erro');
          return Center();
        }
        return MaterialApp(
          title: 'Nex',
          color: CustomColors.primaryDark,
          theme: ThemeData(
            primaryColor: CustomColors.primaryDark,
            accentColor: CustomColors.secondaryDark,
          ),
          routes: {
            '/login': (context) => LoginView(),
            '/bottomBar': (context) => BottomBarView(),
            '/chatInto': (context) => ChatIntoView(),
            '/teste': (context) => TestView(),
            '/splash': (context) => SplashView(),
          },
          initialRoute: '/splash',
        );
      },
    );
  }
}
