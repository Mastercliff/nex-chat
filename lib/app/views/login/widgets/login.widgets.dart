import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nex_chat/app/models/logged_user.model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class ImageIconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icons/next.png',
      height: 90,
      width: 90,
    );
  }
}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.deepPurpleAccent[700],
      child: Text(
        'Entrar',
        style:
            TextStyle(fontFamily: 'Nunito', fontSize: 16, color: Colors.white),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/bottomBar');
      },
    );
  }
}

// ignore: must_be_immutable
class LoginWithButton extends StatefulWidget {
  final String title;
  bool isLoading = false;
  LoginWithButton({
    this.title,
  });
  @override
  _LoginWithButtonState createState() => _LoginWithButtonState();
}

class _LoginWithButtonState extends State<LoginWithButton> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);

      print('signInWithGoogle succeeded: $user');

      return user;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    FaIcon icon;
    Color buttonColor;
    Color fontColor;
    switch (widget.title) {
      case 'Google':
        icon = FaIcon(
          FontAwesomeIcons.google,
          color: Colors.red,
        );
        buttonColor = Colors.white;
        fontColor = Colors.black54;
        break;
      case 'GitHub':
        icon = FaIcon(
          FontAwesomeIcons.github,
          color: Colors.white,
        );
        buttonColor = Colors.green;
        fontColor = Colors.white;
        break;
    }
    return RaisedButton.icon(
      padding: EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: buttonColor,
      icon: icon,
      label: widget.isLoading
          ? Container(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            )
          : Text(
              'Logar com ${widget.title}',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 16,
                color: fontColor,
              ),
            ),
      onPressed: widget.isLoading
          ? () {}
          : () {
              setState(() {
                widget.isLoading = true;
              });
              signInWithGoogle().then(
                (value) {
                  if (value != null) {
                    User user = value;
                    LoggedUser.instance.userName = user.displayName;
                    LoggedUser.instance.email = user.email;
                    LoggedUser.instance.photo = user.photoURL;
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/bottomBar', (route) => false);
                  } else {
                    print('Não Foi');
                    setState(() {
                      widget.isLoading = false;
                    });
                  }
                },
              );
            },
    );
  }
}

class DontHaveAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Ainda não tem uma conta?',
            style: TextStyle(
                fontFamily: 'Nunito', fontSize: 13, color: Colors.white)),
        FlatButton(
            padding: EdgeInsets.only(left: 2),
            child: Text('Cadastre-se',
                style: TextStyle(
                    fontFamily: 'Nunito', fontSize: 13, color: Colors.blue)),
            onPressed: () {}),
      ],
    );
  }
}
