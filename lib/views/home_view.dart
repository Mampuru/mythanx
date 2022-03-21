import 'package:flutter/material.dart';
import '../constants.dart';
import 'bottom_nav_views/profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var currentIndex = 0;
  List<Widget> screens =  <Widget>[
    const Center(child: Text('Home',style: TextStyle(fontSize: 60),),),
    const Center(child: Text('Notifications',style: TextStyle(fontSize: 60),),),
    const ProfileView(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          leading: const Icon(Icons.build_circle_outlined,size:30,color: Colors.white,),
          title: const Text('My ThanX'),
          centerTitle: true,
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
