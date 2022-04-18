import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mythanx/controllers/auth_controller.dart';
import 'package:mythanx/views/independent_views/edit_profile_view.dart';
import 'package:mythanx/views/independent_views/follow_list_view.dart';
import 'package:mythanx/views/widgets/primary_button_outlined.dart';

import '../../constants.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    authController.getUserData();
    super.initState();
  }
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
                Text(authController.userDetails.data.user.username,style: const TextStyle(fontSize: 25),),
                const SizedBox(height: 10.0,),
                PrimaryButtonOutlined(buttonName: "Edit Profile",width: 150,onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfileView()));
                } )
              ],
            )
          ],
        ),
       Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(authController.userDetails.data.user.name,style: const TextStyle(fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding: const EdgeInsets.only(left:16.0),
          child: Text('Country: ${authController.userDetails.data.user.country.name}'),
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FollowListView(title: "Followers",)));
              },
                child: Text('${authController.userDetails.data.user.metadata.presence.followers} followers',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16))),
            InkWell(
                onTap: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const FollowListView(title: "Following",)));
                },
                child: Text('${authController.userDetails.data.user.metadata.presence.following} following',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16))),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
