import 'package:flutter/material.dart';
import 'package:nex_chat/app/models/chat/message.model.dart';
import 'package:nex_chat/styles/colors.dart';

class MessageChat extends StatelessWidget {
  MessageModel messageModel;

  MessageChat(this.messageModel);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(maxWidth: 300),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.transparent),
              color: CustomColors.buttonDark,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 220),
                  child: Text(
                    messageModel.message,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontFamily: 'Nunito', color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Text(
                    '${messageModel.date.hour.toString().padLeft(2, '0')}:${messageModel.date.minute.toString().padLeft(2, '0')}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Nunito',
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ChatDash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: CustomColors.buttonDark,
      ),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration.collapsed(
                  hintText: 'Mensagem',
                  hintStyle:
                      TextStyle(fontFamily: 'Nunito', color: Colors.white70)),
            ),
          ),
          Icon(Icons.send, color: Colors.white),
        ],
      ),
    );
  }
}
