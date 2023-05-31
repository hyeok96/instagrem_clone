import 'package:get/get.dart';

enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

class MainController extends GetxController {
  RxInt pageIndex = 0.obs;

  void changeBottomNav(int value) {
    // enum 타입의 values를 하면 list로 enum의 값들을 가져온다.
    var page = PageName.values[value];
    switch (page) {
      case PageName.UPLOAD:
        break;
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _changePage(value);
        break;
    }
  }

  _changePage(int value) {
    pageIndex(value);
  }
}
