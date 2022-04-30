import 'package:get/get.dart';
import 'package:mythanx/data/mapper/user_model.dart';
import 'package:mythanx/helpers/shared_prefs.dart';

class AuthController extends GetxController {
  var authToken = " ".obs;
  var hasToken = false.obs;
  User userDetails;

  @override
  void onInit() {
    getToken();
    getUserData();
    super.onInit();

  }

  clearAuthToken() {
    authToken = " ".obs;
    userDetails = null;
  }

  void getToken() async {
    try{
      authToken.value = await getAuthToken();
      if(authToken.value != null){
        hasToken.value = true;
      }
    }catch(e){
      //
    }
  }

  void getAuthMethod() async {
    hasToken.value = await getAuth();
  }

  Future<User> getUserData() async {
    try {
      userDetails ??= await getUserDetails();
    }catch(e){
      //
    }
    return userDetails;
  }
}