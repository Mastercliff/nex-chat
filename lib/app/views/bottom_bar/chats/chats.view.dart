import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nex_chat/app/models/chat/chat.model.dart';
import 'package:nex_chat/styles/colors.dart';

class ChatsView extends StatefulWidget {
  @override
  _ChatsViewState createState() => _ChatsViewState();
}

Widget textFormModel(String hint, IconData icon) {
  return Padding(
    padding: EdgeInsets.only(top: 10),
    child: Material(
      elevation: 1,
      color: CustomColors.secondaryDark,
      borderRadius: BorderRadius.circular(10),
      child: TextFormField(
        style: TextStyle(color: Colors.white70, fontFamily: 'Nunito'),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
              fontFamily: 'Nunito', fontSize: 16, color: Colors.white60),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 12, top: 11),
            child: FaIcon(
              icon,
              color: Colors.white60,
              size: 20,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black12, width: 0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black12)),
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
          itemCount: 2 + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: textFormModel('Buscar', Icons.search),
              );
            }
            index = index - 1;
            List names = [
              'João da Silva',
              'Lucas Onorave',
            ];
            return Chat(ChatModel(
                userName: names[index],
                photo:
                    'https://cdn.vox-cdn.com/thumbor/ciRuSgJ8XzCsz8n0U46dfvFcTsA=/0x0:2040x1360/1200x800/filters:focal(857x517:1183x843)/cdn.vox-cdn.com/uploads/chorus_image/image/65444878/acastro_181114_1777_amazon_hq2_0005.0.jpg',
                lastMessage: 'Bom dia Sr.',
                isOnline: false));
          }),
    );
  }
}

class Chat extends StatelessWidget {
  ChatModel chatModel;

  Chat(this.chatModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
      child: Material(
          color: CustomColors.secondaryDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(this.chatModel.photo),
                      backgroundColor: CustomColors.primaryDark,
                      radius: 28,
                    )
                  ],
                ),
                title: Text(
                  this.chatModel.userName,
                  style: TextStyle(
                    color: Colors.white70,
                    fontFamily: 'Nunito',
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.chatModel.lastMessage,
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Nunito',
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.uncharted,
                      color: Colors.white,
                    )
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/chatInto',
                      arguments: this.chatModel);
                },
              )
            ],
          )),
    );
  }
}
