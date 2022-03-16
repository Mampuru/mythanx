import 'package:flutter/material.dart';
import 'package:mythanx/views/auth/sign_up_view.dart';
import 'package:mythanx/views/widgets/primary_button.dart';
import 'package:mythanx/views/widgets/primary_textfield.dart';

import '../../constants.dart';
import '../home_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key key}) : super(key: key);

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100.0,),
            Image.asset(logoPath,width: 300,),
            const SizedBox(height: 40.0,),
            const Text("Sign In",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: PrimaryTextfield(controller: userController, label: "Username"),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeView()));
                }),
                const SizedBox(height: 50.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account ? ",),
                    InkWell(
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpView()));
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
      ),
    );
  }
}
