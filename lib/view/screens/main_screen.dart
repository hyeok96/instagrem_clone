import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/constants/icon_path.dart';
import 'package:instagram_clone/controllers/main_controller.dart';
import 'package:instagram_clone/util/image_data.dart';
import 'package:instagram_clone/view/screens/home_screen.dart';
import 'package:instagram_clone/view/screens/search_screen.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.willPopScope,
      child: Obx(
        () => Scaffold(
          // offStage와 같은 갓
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: [
              const HomeScreen(),
              const SearchScreen(),
              Container(
                child: const Center(
                  child: Text("UPLOAD"),
                ),
              ),
              Container(
                child: const Center(
                  child: Text("ACTIVITY"),
                ),
              ),
              Container(
                child: const Center(
                  child: Text("MYPAGE"),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: controller.pageIndex.value,
            elevation: 0,
            onTap: controller.changeBottomNav,
            items: [
              BottomNavigationBarItem(
                icon: ImageData(icon: IconPath.homeOff),
                activeIcon: ImageData(icon: IconPath.homeOn),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: ImageData(icon: IconPath.searchOff),
                activeIcon: ImageData(icon: IconPath.searchOn),
                label: "search",
              ),
              BottomNavigationBarItem(
                icon: ImageData(icon: IconPath.uploadIcon),
                label: "upload",
              ),
              BottomNavigationBarItem(
                icon: ImageData(icon: IconPath.activeOff),
                activeIcon: ImageData(icon: IconPath.activeOn),
                label: "active",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  height: 30,
                  width: 30,
                ),
                label: "Home",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
