import 'package:flutter/material.dart';
import 'package:mythanx/views/auth/sign_in_view.dart';
import 'package:mythanx/views/widgets/primary_button.dart';
import 'package:mythanx/views/widgets/primary_textfield.dart';

import '../../constants.dart';
import '../independent_views/home_view.dart';

enum ContactOption { phone, email }

var _country = [
  "ZA",
  "ZW",
  "ZB",
  "EU",
  "US",
];
class SignUpView extends StatefulWidget {
  const SignUpView({Key key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final phoneController = TextEditingController();
  final countryController = TextEditingController();
  final emailController = TextEditingController();
  String country;
  ContactOption _character = ContactOption.phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8,56,8,8),
          child: buildCard(context),
        )
      ),
    );
  }

  Widget buildCard(BuildContext context){
    double cWidth = MediaQuery.of(context).size.width;

    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10.0,),
          const Text("Sign Up",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16,8,16,8),
                child: PrimaryTextfield(controller: nameController, label: "Name"),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16,8,16,8),
                child: PrimaryTextfield(controller: userController, label: "Username"),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16,8,16,8),
                child: buildCountry(),
              ),
              SizedBox(
                width: cWidth,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: cWidth/2.5,
                      child: ListTile(
                        title: const Text('Phone'),
                        leading: Radio<ContactOption>(
                          value: ContactOption.phone,
                          groupValue: _character,
                          onChanged: (ContactOption value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: cWidth/2,
                      child: ListTile(
                        title: const Text('Email'),
                        leading: Radio<ContactOption>(
                          value: ContactOption.email,
                          groupValue: _character,
                          onChanged: (ContactOption value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _character == ContactOption.phone ?
              Padding(
                padding: const EdgeInsets.fromLTRB(16,8,16,8),
                child: PrimaryTextfield(controller: phoneController, label: "Phone",textInputType: TextInputType.number,),
              ) :
              Padding(
                padding: const EdgeInsets.fromLTRB(16,8,16,8),
                child: PrimaryTextfield(controller: emailController, label: "Email"),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(16,8,16,8),
                child: PrimaryTextfield(controller: passwordController, label: "Password",obscureText: true,),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16,8,16,8),
                child: PrimaryTextfield(controller: passwordConfirmController, label: "Confirm Password",obscureText: true,),
              ),
              const SizedBox(height: 30.0,),
              PrimaryButton(buttonName: "Sign Up", onTap: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeView()));
              }),
              const SizedBox(height: 40.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Have an account already? ",),
                  InkWell(
                    onTap: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInView()));
                    },
                    child: const Text("Sign In",
                      style:TextStyle(color: kTertiaryColor,fontWeight: FontWeight.w900),),
                  ),
                ],
              ),
              const SizedBox(height: 10.0,),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCountry() => Container(
      padding: const EdgeInsets.symmetric( vertical: 5),
      decoration: BoxDecoration(
          color: kWhite, borderRadius: BorderRadius.circular(20)),
      child: DropdownButtonFormField<String>(
        items: _country
            .map((value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ))
            .toList(),
        onChanged: (value) async {
          setState(() {
            country = value;
          });
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => value == null ? 'Please select your country' : null,
        decoration: const InputDecoration(
          labelText: 'Country',
          labelStyle: TextStyle(
            color: kBodyTextColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kBodyTextColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kBodyTextColor),
          ),
        ),
        elevation: 2,
        style: const TextStyle(
          color: kBodyTextColor,
        ),
        isDense: true,
        iconSize: 30.0,
        iconEnabledColor: kBodyTextColor,
      ));
}

