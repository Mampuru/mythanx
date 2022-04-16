import 'package:get/get.dart';
import 'package:mythanx/helpers/shared_prefs.dart';

class AuthController extends GetxController {
  var authToken = " ".obs;
  var hasToken = false.obs;

  @override
  void onInit() {
    getToken();
    super.onInit();
  }

  clearAuthToken() {
    authToken = " ".obs;
  }

  void getToken() async {
      authToken.value = await getAuthToken();
      if(authToken.value != null){
        hasToken.value = true;
      }
    }

  // void getUserData() async {
  //   Map<String, dynamic> result = await getLoggedInUser(await getAuthToken());
  //   email.value = result["me"]["email"];
  //   role.value  =  result["me"]["lastName"];
  //   name.value =  result["me"]["firstName"];
  // }
}