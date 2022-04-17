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
    super.onInit();
  }

  clearAuthToken() {
    authToken = " ".obs;
    userDetails = null;
  }

  void getToken() async {
      authToken.value = await getAuthToken();
      if(authToken.value != null){
        hasToken.value = true;
      }
    }

  Future<User> getUserData() async {
    userDetails = await getUserDetails();
    return userDetails;
  }
}