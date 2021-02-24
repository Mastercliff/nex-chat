import 'package:flutter/material.dart';
import 'package:nex_chat/app/models/chat/chat.model.dart';
import 'package:nex_chat/app/models/chat/message.model.dart';
import 'package:nex_chat/app/widgets/chat.widgets.dart';

class ChatIntoView extends StatefulWidget {
  @override
  _ChatIntoViewState createState() => _ChatIntoViewState();
}

class _ChatIntoViewState extends State<ChatIntoView> {
  
  @override
  Widget build(BuildContext context) {
    final ChatModel routeArgs = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        automaticallyImplyLeading: false,
        titleSpacing: 2,
        title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FlatButton.icon(
                  icon: Icon(
                    Icons.keyboard_arrow_left,
                    size: 32,
                    color: Colors.white
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  label: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.black12,
                    backgroundImage:
                        routeArgs.photo.isEmpty
                        ? AssetImage('assets/icons/next.png')
                        : NetworkImage(routeArgs.photo),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                  routeArgs.userName,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                  ),
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.start,  
                  children: [Text(
                  'Offline',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 12,
                  ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                  radius: 4,
                  backgroundColor: routeArgs.isOnline
                      ? Colors.greenAccent
                      : Colors.grey[400],
                  )
                  ],
                  )
                  ],
                ),
              ],
            ),
      ),
      body: Column(
        children: [
        Expanded(child: ListView.builder(
        itemCount: 1,
        padding: EdgeInsets.only(top: 10),
        itemBuilder: (context, index){
          return MessageChat(MessageModel(message: 'Teste Gigante de mensagem, acho que posso aumentar ou diminuir algo', date: DateTime.now()));
        }
        ),
        ),
        ChatDash()
        ],
      )
    );
  }
}