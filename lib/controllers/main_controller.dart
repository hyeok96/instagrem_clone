import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/view/screens/upload_screen.dart';
import '../view/widgets/messagePopup.dart';

enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

class MainController extends GetxController {
  RxInt pageIndex = 0.obs;
  GlobalKey<NavigatorState> searchPageNavigationKey = GlobalKey();
  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    // enum 타입의 values를 하면 list로 enum의 값들을 가져온다.
    var page = PageName.values[value];
    switch (page) {
      case PageName.UPLOAD:
        Get.to(() => const UploadScreen());
        break;
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
  }

  _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    if (!hasGesture) return;
    if (bottomHistory.last != value) {
      bottomHistory.add(value);
    }
  }

  Future<bool> willPopScope() async {
    if (bottomHistory.length == 1) {
      showDialog(
        context: Get.context!,
        builder: (context) => MessagePopup(
          title: "시스템",
          message: "종료하세겠습니까?",
          okCallback: () {
            exit(0);
          },
          cancelCallBack: Get.back,
        ),
      );
      return true;
    } else {
      var page = PageName.values[bottomHistory.last];
      if (page == PageName.SEARCH) {
        var value = await searchPageNavigationKey.currentState!.maybePop();
        if (value) return false;
      }

      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture: false);
      return false;
    }
  }
}
