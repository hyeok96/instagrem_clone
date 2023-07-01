import 'package:get/get.dart';
import 'package:instagram_clone/model/instagrem_user.dart';
import 'package:instagram_clone/repository/user_repositiry.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find<AuthController>();
  Rx<IUser> user = IUser().obs;

  Future<IUser?> loginUser(String uid) async {
    var userData = await UserRepository.loginUserByUid(uid);
    return userData;
  }

  Future<bool?> signup(IUser signupUser) async {
    var result = await UserRepository.signup(signupUser);
    if (result) {
      user(signupUser);
    } else {}
    return null;
  }
}
