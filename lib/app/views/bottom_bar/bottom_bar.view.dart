import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nex_chat/app/views/bottom_bar/chats/chats.view.dart';
import 'package:nex_chat/app/views/bottom_bar/groups.view.dart';
import 'package:nex_chat/app/views/bottom_bar/settings.view.dart';

class BottomBarView extends StatefulWidget {
  @override
  _BottomBarViewState createState() => _BottomBarViewState();
}

TabController tabController;
int actIndex = 0;
List<Widget> views =[
  ChatsView(),
  GroupsView(),
  SettingsView()
];

List backColors = [
  Colors.white10,
  Colors.deepPurpleAccent[400],
  Colors.deepPurple[900],
];

class _BottomBarViewState extends State<BottomBarView>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: views[actIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'Chats',
            icon: FaIcon(FontAwesomeIcons.comment)
            ),
          BottomNavigationBarItem(
            label: 'Grupos',
            icon: Icon(Icons.people_outline)
            ),
          BottomNavigationBarItem(
            label: 'Configurações',
            icon: Icon(Icons.settings,)
            ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: backColors[actIndex],
        currentIndex: actIndex,
        onTap: (value){
          setState(() {
            actIndex = value;
          });
        },
        ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, size: 32,),
          backgroundColor: Colors.transparent,
          onPressed: (){

          },
        ),
    );
  }
}