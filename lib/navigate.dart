import 'package:bloodwave/home1.dart';
import 'package:bloodwave/userpage.dart';
import 'package:flutter/material.dart';
//import 'package:bloodwave/alerts.dart';
import 'package:bloodwave/profile.dart';
import 'package:bloodwave/drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  static final List<Widget> _widgetoptions = <Widget>[
    const MyHome(),
    const UserPage(),
    //const SMSPage(),
    ProfileScreen(),
  ];
  void _onitemtapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MyHeader(),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color(0xff191970),
      ),
      body: Center(
        child: _widgetoptions[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff191970),
        currentIndex: _currentIndex,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              backgroundColor: Color(0xff191970),
              label: "home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              backgroundColor: Color(0xff191970),
              label: "add"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              backgroundColor: Color(0xff191970),
              label: "profile"),
        ],
        onTap: _onitemtapped,
      ),
    );
  }
}
