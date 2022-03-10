import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: IconButton(
              iconSize: 150,
              padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
              icon: const FaIcon(
                FontAwesomeIcons.skype,
                color: Colors.blue,
                //size: 40,
              ),
              onPressed: () {
                print("PRESSED");
              })),
    );
  }
}
