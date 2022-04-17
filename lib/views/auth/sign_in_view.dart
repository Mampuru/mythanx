import 'package:flutter/material.dart';
import 'package:mythanx/api/api_service.dart';
import 'package:mythanx/helpers/shared_prefs.dart';
import 'package:mythanx/views/auth/sign_up_view.dart';
import 'package:mythanx/views/widgets/primary_loading_button.dart';
import 'package:mythanx/views/widgets/primary_textfield.dart';
import 'package:mythanx/views/widgets/primary_toast.dart';

import '../../constants.dart';
import '../independent_views/home_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key key}) : super(key: key);

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

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
                  child: PrimaryTextfield(controller: passwordController, label: "Password",obscureText: true,),
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
                 PrimaryLoadingButton(buttonName: "Sign In",isProcessing: isLoading,onTap: () async {
                   setState(() {
                     isLoading = true;
                   });
                   await login(userController.text, passwordController.text).then((result) => {
                       if(result != null){
                         setUserDetails(result),
                         setAuth(true),
                         setAuthToken(result.data.token),
                         setState(() {
                           isLoading = false;
                         }),
                         Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeView()))
                       }else {
                         setState(() {
                           isLoading = false;
                         }),
                         PrimaryToast().displayToast("Invalid credentials", kErrorColor)
                       }
                     // }
                   });

               },),
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
