import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nex_chat/app/models/logged_user.model.dart';
import 'package:nex_chat/styles/colors.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

splashInit(context) {
  User user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    LoggedUser.instance.userName = user.displayName;
    LoggedUser.instance.email = user.email;
    LoggedUser.instance.photo = user.photoURL;
    Navigator.pushNamedAndRemoveUntil(context, '/bottomBar', (route) => false);
  } else {
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2)).then((value) => {splashInit(context)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryDark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bem Vindo",
              style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Preparando tudo, um momento...",
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.white,
              ),
              strokeWidth: 3,
            )
          ],
        ),
      ),
    );
  }
}
