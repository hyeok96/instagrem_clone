import 'package:get/get.dart';
import 'package:instagram_clone/controllers/AuthController.dart';
import 'package:instagram_clone/model/instagrem_user.dart';

class MyPageController extends GetxController {
  Rx<IUser> targetUser = IUser().obs;

  void _loaData() {
    setTargetUser();
  }

  void setTargetUser() {
    var uid = Get.parameters['targetUid'];
    if (uid == null) {
      targetUser(AuthController.to.user.value);
    } else {}
  }

  @override
  void onInit() {
    super.onInit();
    _loaData();
  }
}
