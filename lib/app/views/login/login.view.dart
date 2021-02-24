import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  Widget wellComeText(String msg){
    return Text(
      msg,
      textAlign: TextAlign.center,
      style: TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w100,
      fontSize: 27,
      color: Colors.white
     ),
     );
  }

  Widget textFormModel(String hint, IconData icon){
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Material(
        elevation: 1,
        color: Colors.white10,
        borderRadius: BorderRadius.circular(10),
        child: TextFormField(
        style: TextStyle(
          color: Colors.white70,
          fontFamily: 'Nunito'
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 16,
            color: Colors.white60
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left:12,top:10),
            child: FaIcon(
            icon,
            color: Colors.white60,
            size: 22,
            ),),
          contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black12)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black12)
          ),
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
                ImageIcon(),
                SizedBox(height: 20),
                textFormModel('Usuário', FontAwesomeIcons.user),
                textFormModel('Senha', FontAwesomeIcons.lock),
                 DontHaveAccount(),
              ],
              ),
              )
          ),
        ),
      ),
    ),
    bottomNavigationBar: Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        LoginButton(),
        SizedBox(height: 10),
        LoginWithButton()
        ],
    ),
    )
    );
  }
}

class ImageIcon extends StatelessWidget {
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
      padding: EdgeInsets.symmetric(vertical: 18),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      color: Colors.deepPurpleAccent[700],
      child: Text(
        'Entrar',
        style: TextStyle(
          fontFamily: 'Nunito',
          fontSize: 16,
          color: Colors.white
        ),
        ),
      onPressed: (){
        Navigator.pushNamed(context, '/bottomBar');
      },
    );
  }
}

class LoginWithButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return RaisedButton.icon(
      padding: EdgeInsets.symmetric(vertical: 17),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      color: Colors.green,
      icon: FaIcon(
        FontAwesomeIcons.githubAlt, 
        color: Colors.white,
        ),
      label: Text(
        'Logar com GitHub',
        style: TextStyle(
          fontFamily: 'Nunito',
          fontSize: 16,
          color: Colors.white
        )
        ),
      onPressed: (){});
  }
}


class DontHaveAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
        'Ainda não tem uma conta?',
        style: TextStyle(
          fontFamily: 'Nunito',
          fontSize: 13,
          color: Colors.white
        )
        ),
        FlatButton(
        padding: EdgeInsets.only(left:2),
        child: Text(
        'Cadastre-se',
        style: TextStyle(
          fontFamily: 'Nunito',
          fontSize: 13,
          color: Colors.blue
        )
        ),
        onPressed: (){}),
      ],
    );
  }
}