import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/controllers/AuthController.dart';
import 'package:instagram_clone/model/instagrem_user.dart';
import 'package:instagram_clone/view/screens/main_screen.dart';
import 'package:instagram_clone/view/screens/signup_screen.dart';

class Root extends GetView<AuthController> {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, AsyncSnapshot<User?> user) {
        if (user.hasData) {
          return FutureBuilder<IUser?>(
            future: controller.loginUser(user.data!.uid),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const MainScreen();
              } else {
                return Obx(() => controller.user.value.uid != null
                    ? const MainScreen()
                    : SignupScreen(uid: user.data!.uid));
              }
            },
          );
        }
        return Container();
      },
    );
  }
}
