import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nex_chat/app/views/bottom_bar/chats/chats.view.dart';
import 'package:nex_chat/app/views/bottom_bar/groups.view.dart';
import 'package:nex_chat/app/views/bottom_bar/profile/profile.view.dart';
import 'package:nex_chat/styles/colors.dart';

class BottomBarView extends StatefulWidget {
  @override
  _BottomBarViewState createState() => _BottomBarViewState();
}

TabController tabController;

List<Widget> views = [
  GroupsView(),
  ChatsView(),
  GroupsView(),
  ProfileView(),
];

List backColors = [
  Colors.white10,
  Colors.white10,
  Colors.white10,
  Colors.white10,
];

class _BottomBarViewState extends State<BottomBarView> {
  int actIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryDark,
      body: views[actIndex],
      bottomNavigationBar: BottomNavyBar(
        items: [
          BottomNavyBarItem(
            title: Text('Adicionar'),
            icon: Icon(Icons.add),
            inactiveColor: Colors.grey[700],
            activeColor: Colors.purpleAccent[700],
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            title: Text('Chats'),
            icon: FaIcon(FontAwesomeIcons.feather),
            inactiveColor: Colors.grey[700],
            activeColor: Colors.purpleAccent[700],
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            title: Text('Grupos'),
            icon: Icon(Icons.group_work_rounded),
            inactiveColor: Colors.grey[700],
            activeColor: Colors.purpleAccent[700],
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            title: Text('Perfil'),
            icon: Icon(
              Icons.person_rounded,
            ),
            inactiveColor: Colors.grey[700],
            activeColor: Colors.purpleAccent[700],
            textAlign: TextAlign.center,
          ),
        ],
        selectedIndex: actIndex,
        backgroundColor: CustomColors.secondaryDark,
        showElevation: true,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => actIndex = index),
      ),
    );
  }
}

//  BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(
//               label: 'Chats', icon: FaIcon(FontAwesomeIcons.feather)),
//           BottomNavigationBarItem(
//               label: 'Grupos', icon: Icon(Icons.people_outline)),
//           BottomNavigationBarItem(
//               label: 'Perfil', icon: Icon(Icons.person_rounded)),
//           BottomNavigationBarItem(
//               label: 'Configurações',
//               icon: Icon(
//                 Icons.settings,
//               ),
//               ),
//         ],
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white54,
//         showSelectedLabels: true,
//         showUnselectedLabels: false,
//         backgroundColor: backColors[actIndex],
//         currentIndex: actIndex,
//         onTap: (value) {
//           setState(() {
//             actIndex = value;
//           });
//         },
//       )
