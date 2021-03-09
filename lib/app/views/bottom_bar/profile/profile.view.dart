import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nex_chat/app/models/logged_user.model.dart';
import 'package:nex_chat/app/views/bottom_bar/profile/widgets/profile.widgets.dart';
import 'package:nex_chat/styles/colors.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String photoURL = LoggedUser.instance.photo;

  @override
  Widget build(BuildContext context) {
    print(photoURL);
    if (photoURL.indexOf('google') != -1) {
      photoURL = photoURL.replaceFirst('s96-c', 's400-c');
    }
    print(photoURL);
    return Container(
      margin: EdgeInsets.only(top: 40, left: 15, right: 15, bottom: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[900],
                        backgroundImage: NetworkImage(photoURL),
                        radius: 41,
                      ),
                    ),
                    SizedBox(width: 15),
                    Flexible(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LoggedUser.instance.userName,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          "Nome de Usuário",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          LoggedUser.instance.email,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: CustomColors.buttonDark, // background
                    onPrimary: Colors.white, // foreground
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  icon: Icon(
                    Icons.edit_outlined,
                    color: Colors.white.withOpacity(0.8),
                  ),
                  label: Text(
                    "Editar",
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: CustomColors.buttonDark, // background
                    onPrimary: Colors.white, // foreground
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white.withOpacity(0.8),
                  ),
                  label: Text(
                    "Configurações",
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent[400], // background
                    onPrimary: Colors.white, // foreground
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  icon: Icon(
                    Icons.exit_to_app_rounded,
                  ),
                  label: Text("Sair"),
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.grey[900],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          content: Center(
                            child: Container(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                                strokeWidth: 3,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                    try {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pop(context);
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/login', (route) => false);
                    } catch (e) {
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
