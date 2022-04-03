import 'package:flutter/material.dart';
import 'package:mythanx/views/widgets/primary_button.dart';
import 'package:mythanx/views/widgets/primary_textfield.dart';

import '../../constants.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key key}) : super(key: key);

  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final phoneController = TextEditingController();
  final countryController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Edit Profile",style: TextStyle(color: kWhite),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(userIconPath,width: 50,),
                const SizedBox(width: 50.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Username',style: TextStyle(fontSize: 22),),
                    const SizedBox(height: 10.0,),
                    InkWell(
                      onTap: () async {
                        ///Endpoint to update profile picture
                      },
                      child: const Text("Change profile picture",style: TextStyle(color: kPrimaryColor),),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 30.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Name",style: TextStyle(fontWeight: FontWeight.bold),),
                PrimaryTextfield(controller: nameController, label: "John Doe"),
                const SizedBox(height: 8.0,),
                const Text("Username",style: TextStyle(fontWeight: FontWeight.bold),),
                PrimaryTextfield(controller: userController, label: "STAR_BOY"),
                const SizedBox(height: 8.0,),
                const Text("Email",style: TextStyle(fontWeight: FontWeight.bold),),
                PrimaryTextfield(controller: nameController, label: "john@gmail.com"),
                const SizedBox(height: 8.0,),
                const Text("Phone number",style: TextStyle(fontWeight: FontWeight.bold),),
                PrimaryTextfield(controller: userController, label: "+2764576433"),
                const SizedBox(height: 8.0,),
                const Text("Country",style: TextStyle(fontWeight: FontWeight.bold),),
                PrimaryTextfield(controller: userController, label: "ZA"),
              ],
            ),
            const SizedBox(height: 30.0,),
           PrimaryButton(buttonName: "Update", onTap: () async {
             /// Add endpoint to update user profile
           })
          ],
        ),
      ),
    );
  }
}
