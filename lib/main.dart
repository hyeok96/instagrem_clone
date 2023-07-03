import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/controllers/main_controller.dart';
import 'package:instagram_clone/controllers/mypageController.dart';
import 'package:instagram_clone/view/root.dart';

import 'controllers/AuthController.dart';
import 'controllers/uploadController.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "inatagramclone",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(
          AuthController(),
        );
        Get.lazyPut(
          () => MainController(),
          fenix: true,
        );
        Get.lazyPut(
          () => MyPageController(),
          fenix: true,
        );
        Get.lazyPut(
          () => UploadController(),
          fenix: true,
        );
      }),
      home: const Root(),
    );
  }
}
