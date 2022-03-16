import 'package:flutter/material.dart';

import '../constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var currentIndex = 0;
  final screens = const [
    Center(child: Text('Home',style: TextStyle(fontSize: 60),),),
    Center(child: Text('Notifications',style: TextStyle(fontSize: 60),),),
    Center(child: Text('Profile',style: TextStyle(fontSize: 60),),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          leading: null,
          title: const Text('My ThanX'),
        ),
        body: screens[currentIndex],
      bottomNavigationBar: buildBottomNav(),
    );
  }

  Widget buildBottomNav(){
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor:kPrimaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none_outlined),
          label: 'Notifications',
          backgroundColor:kPrimaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
          backgroundColor:kPrimaryColor,
        ),
      ],
    );
  }
}
