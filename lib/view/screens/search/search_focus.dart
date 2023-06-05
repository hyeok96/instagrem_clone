import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/constants/icon_path.dart';
import 'package:instagram_clone/controllers/main_controller.dart';
import 'package:instagram_clone/util/image_data.dart';

class SearchFocus extends StatefulWidget {
  const SearchFocus({super.key});

  @override
  State<SearchFocus> createState() => _SearchFocusState();
}

class _SearchFocusState extends State<SearchFocus>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  PreferredSizeWidget TabMenu() {
    return PreferredSize(
      preferredSize: Size.fromHeight(AppBar().preferredSize.height),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xffe4e4e4),
            ),
          ),
        ),
        height: AppBar().preferredSize.height,
        width: Size.infinite.width,
        child: TabBar(
          indicatorColor: Colors.black,
          controller: _tabController,
          tabs: [
            _TabMenuOne("인기"),
            _TabMenuOne("계정"),
            _TabMenuOne("오디오"),
            _TabMenuOne("태그"),
            _TabMenuOne('장소'),
          ],
        ),
      ),
    );
  }

  Widget _TabMenuOne(String menu) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        menu,
        style: const TextStyle(fontSize: 15, color: Colors.black),
      ),
    );
  }

  Widget _body() {
    return Container(
      child: TabBarView(
        controller: _tabController,
        children: [
          Container(
            child: const Center(
              child: Text("인기페이지"),
            ),
          ),
          Container(
            child: const Center(
              child: Text("계정페이지"),
            ),
          ),
          Container(
            child: const Center(
              child: Text("오디오페이지"),
            ),
          ),
          Container(
            child: const Center(
              child: Text("태그페이지"),
            ),
          ),
          Container(
            child: const Center(
              child: Text("장소페이지"),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            // Get.back();
            Get.find<MainController>().willPopScope();
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ImageData(icon: IconPath.backBtnIcon),
          ),
        ),
        titleSpacing: 0,
        title: Container(
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: const Color(0xffefefef),
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "검색",
              contentPadding: EdgeInsets.only(
                left: 15,
                top: 7,
                bottom: 7,
              ),
              isDense: true,
            ),
          ),
        ),
        bottom: TabMenu(),
      ),
      body: _body(),
    );
  }
}
