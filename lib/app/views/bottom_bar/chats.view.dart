import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatsView extends StatefulWidget {
  @override
  _ChatsViewState createState() => _ChatsViewState();
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
            padding: EdgeInsets.only(left:12,top:11),
            child: FaIcon(
            icon,
            color: Colors.white60,
            size: 20,
            ),),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black12, width: 0)
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

class _ChatsViewState extends State<ChatsView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(),
      child: ListView.builder(
        itemCount: 4 * 2,
        itemBuilder: (context, index){
        if(index.isOdd){
          return Divider(color: Colors.black38,);
        }
        return ChatModel(userName: 'User Name', photo: 'https://i.stack.imgur.com/l60Hf.png', lastMessage: 'Fala ai $index',);
      }),
    );
  }
}

class ChatModel extends StatelessWidget {
  String userName;
  String lastMessage;
  String photo;

  ChatModel({this.userName, this.lastMessage, this.photo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.5, horizontal: 5),
      child: Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
          backgroundImage: NetworkImage(this.photo),
          radius: 28,
            )
          ],
        ),
          title: Text(
            this.userName,
            style: TextStyle(
              color: Colors.white70,
              fontFamily: 'Nunito',
              fontSize: 13,
            ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
              this.lastMessage,
              style: TextStyle(
              color: Colors.white70,
              fontFamily: 'Nunito',
              fontSize: 13,
              ),
              ),
              ],
            ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.angleDoubleRight,
                color: Colors.blue,
              )
            ],
          ),
          onTap: (){},
        )
        ],
      )
    ),
    );
  }
}