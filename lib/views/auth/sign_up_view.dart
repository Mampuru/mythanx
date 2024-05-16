import 'package:flutter/material.dart';
import 'package:mythanx/api/api_service.dart';
import 'package:mythanx/data/dto/country_dto.dart';
import 'package:mythanx/data/dto/user_dto.dart';
import 'package:mythanx/helpers/shared_prefs.dart';
import 'package:mythanx/views/auth/sign_in_view.dart';
import 'package:mythanx/views/widgets/primary_loading_button.dart';
import 'package:mythanx/views/widgets/primary_textfield.dart';

import '../../constants.dart';
import '../independent_views/home_view.dart';

enum ContactOption { phone, email }

var _country = [];

var _countryMap = {};

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

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
  late String country;
  late String countryCode;
  ContactOption _character = ContactOption.phone;
  bool isLoading = false;
  bool obscureText = true;
  bool passwordError = false;

  @override
  void initState() {
    getCounty();
    super.initState();
  }

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
                child: buildPassword(context),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16,8,16,8),
                child: buildConfirmPassword(context),
              ),
              passwordError ?
              const Text("Password doesn't match",style: TextStyle(color: kErrorColor),) : Container(),
              const SizedBox(height: 30.0,),
              PrimaryLoadingButton(buttonName: "Sign Up",isProcessing: isLoading,onTap: () async {
                setState(() {
                  isLoading = true;
                });

                var user = UserDto(
                    name: nameController.text,
                    username: userController.text,
                    country: countryCode,
                    email: emailController.text.trim().toLowerCase(),
                    phone: phoneController.text,
                    password: passwordController.text
                );

                await register(user).then((result) => {
                  if(result.data.token != null){
                    setUserDetails(result),
                    setAuth(true),
                    setAuthToken(result.data.token),
                    setState(() {
                      isLoading = false;
                    }),
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeView())),
                  }else{
                    setState(() {
                      isLoading = false;
                    }),
                  }
                });
              },),
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
            country = value!;
          });
          setCountryCode(value!);
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

  Widget buildConfirmPassword(BuildContext context) => TextField(
    textCapitalization: TextCapitalization.none,
    onChanged: (value)  {
      if(value != passwordController.text){
        setState(() {
          passwordError = true;
        });
      }else{
        setState(() {
          passwordError = false;
        });
      }
    },
    autocorrect: false,
    enableSuggestions: false,
    keyboardType: TextInputType.text,
    controller: passwordConfirmController,
    obscureText: obscureText ,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
    decoration: InputDecoration(
      suffixIcon: IconButton(
          icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          }),
      hintText: "Confirm Password",
      hintStyle: const TextStyle(color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: passwordError ? kErrorColor : kBodyTextColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: passwordError ? kErrorColor : Theme.of(context).primaryColor,
        ),
      ),
    ),
  );

  Widget buildPassword(BuildContext context) => TextField(
    textCapitalization: TextCapitalization.none,
    autocorrect: false,
    enableSuggestions: false,
    keyboardType: TextInputType.text,
    controller: passwordController,
    obscureText: obscureText ,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
    decoration: InputDecoration(
      suffixIcon: IconButton(
          icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          }),
      hintText: "Password",
      hintStyle: const TextStyle(color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: kBodyTextColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
      ),
    ),
  );

  Future<List<dynamic>?> getCounty() async {
    _country.clear();
    CountryDto result = await getCountryList();
    countryNameList(result.data);
    countryList(result.data);
    if (_country == null) {
      return null;
    }
    setState(() {
      _country = _country;
    });
    return _country;
  }

  void setCountryCode(String country) {
    if (_countryMap.isNotEmpty) {
      setState(() {
        countryCode = _countryMap[country];
      });
    }

  }

  //Creating a map that consist of
  void countryList(List<dynamic> itemList) {
    for (var i = 0; i < itemList.length; i++){
      _countryMap[itemList[i].name] = itemList[i].code;
    }
  }

  //Create list of counties to display on the drop down
  void countryNameList(List<dynamic> itemList) {
    for (var i = 0; i < itemList.length; i++){
      _country.add(itemList[i].name);
    }
  }
}

