import 'package:flutter/material.dart';
import 'package:mythanx/views/bottom_nav_views/edit_profile_view.dart';
import 'package:mythanx/views/widgets/primary_button_outlined.dart';

import '../../constants.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(userIconPath,width: 125,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Username',style: TextStyle(fontSize: 25),),
                const SizedBox(height: 10.0,),
                PrimaryButtonOutlined(buttonName: "Edit Profile",width: 150,onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfileView()));
                } )
              ],
            )
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text('Name Surname',style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        const Padding(
          padding: EdgeInsets.only(left:16.0),
          child: Text('Bio'),
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text('15 followers'),
            Text('156 following'),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
