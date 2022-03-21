import 'package:flutter/material.dart';
import 'package:mythanx/views/auth/sign_in_view.dart';
import 'package:mythanx/views/widgets/primary_button.dart';
import 'package:mythanx/views/widgets/primary_textfield.dart';

import '../../constants.dart';
import '../home_view.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16,56,16,16),
          child: buildCard(),
        )
      ),
    );
  }

  Widget buildCard(){
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
                child: PrimaryTextfield(controller: emailController, label: "Email"),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16,8,16,8),
                child: PrimaryTextfield(controller: phoneController, label: "Phone",textInputType: TextInputType.number,),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16,8,16,8),
                child: PrimaryTextfield(controller: countryController, label: "Country"),
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
}

