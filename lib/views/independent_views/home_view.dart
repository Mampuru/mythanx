import 'package:flutter/material.dart';
import 'package:mythanx/views/bottom_nav_views/follow_view.dart';
import 'package:mythanx/views/bottom_nav_views/search_view.dart';
import '../../constants.dart';
import '../bottom_nav_views/profile_view.dart';
import '../bottom_nav_views/wallet_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var currentIndex = 0;
  List<Widget> screens =  <Widget>[
    const FollowView(),
    const SearchView(),
    const WalletView(),
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
          icon: Icon(Icons.home_outlined),
          label: 'Home',
          backgroundColor:kPrimaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
          backgroundColor:kPrimaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet_outlined),
          label: 'Wallet',
          backgroundColor:kPrimaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: 'Profile',
          backgroundColor:kPrimaryColor,
        ),
      ],
    );
  }
}
