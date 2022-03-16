import 'package:flutter/material.dart';
import 'package:mythanx/views/widgets/primary_button.dart';
import 'package:mythanx/views/widgets/primary_textfield.dart';

import '../../constants.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key key}) : super(key: key);

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(logoPath,width: 300,),
          const SizedBox(height: 40.0,),
          const Text("Sign In",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: PrimaryTextfield(controller: emailController, label: "Email"),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: PrimaryTextfield(controller: passwordController, label: "Password"),
              ),
              InkWell(
                onTap: () async {
                  //forgot password endpoint
                },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(200,16,0,16),
                    child: Text("Forgot Password ?",
                      style:TextStyle(color: kTertiaryColor,fontWeight: FontWeight.bold),),
                  )),
              const SizedBox(height: 30.0,),
              PrimaryButton(buttonName: "Sign In", onTap: () async {
              }),
              const SizedBox(height: 50.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account ? ",),
                  InkWell(
                    onTap: () async {
                      //redirect
                    },
                    child: const Text("Sign Up",
                      style:TextStyle(color: kTertiaryColor,fontWeight: FontWeight.w900),),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
