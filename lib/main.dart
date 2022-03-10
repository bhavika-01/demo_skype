import 'package:flutter/material.dart';
import 'package:skype_app/chatscreen.dart';
import 'package:skype_app/contacts.dart';
import 'package:skype_app/Homescreen.dart';
import 'package:skype_app/Callsscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skype_app/first.dart';
import 'google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:getwidget/getwidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ChatScreen(),
    CallScreen(),
    ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //appBar: AppBar(
      // title: const Text(
      //   'Skype',
      // ),
      // centerTitle: true,
      // backgroundColor: Colors.blue,
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(),
              ));
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.edit),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        elevation: 0,
        iconSize: 40,
        mouseCursor: SystemMouseCursors.grab,
        currentIndex: _selectedIndex,
        //showSelectedLabels: false,
        //showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.blue),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              color: Colors.blue,
            ),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.call_sharp,
              color: Colors.blue,
            ),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.contacts,
              color: Colors.blue,
            ),
            label: 'Contacts',
          ),
        ],
        //currentIndex: _selectedIndex,
        //selectedItemColor: Colors.white,
        //onTap: _onItemTapped,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
