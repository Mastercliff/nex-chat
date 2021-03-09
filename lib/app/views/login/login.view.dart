import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nex_chat/app/views/login/widgets/login.widgets.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  Widget wellComeText(String msg) {
    return Text(
      msg,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w100,
          fontSize: 27,
          color: Colors.white),
    );
  }

  Widget textFormModel(String hint, IconData icon) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Material(
        elevation: 1,
        color: Colors.white10,
        borderRadius: BorderRadius.circular(10),
        child: TextFormField(
          style: TextStyle(color: Colors.white70, fontFamily: 'Nunito'),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
                fontFamily: 'Nunito', fontSize: 16, color: Colors.white60),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 12, top: 10),
              child: FaIcon(
                icon,
                color: Colors.white60,
                size: 22,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black12)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black12)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            child: Form(
                child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),
                  ImageIconWidget(),
                  SizedBox(height: 20),
                  LoginWithButton(title: 'Google'),
                  SizedBox(height: 10),
                  LoginWithButton(title: 'GitHub'),
                ],
              ),
            )),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [],
        ),
      ),
    );
  }
}
