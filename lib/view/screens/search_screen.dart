import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiver/iterables.dart';

import 'search/search_focus.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<List<int>> groupBox = [[], [], []];
  // groupIndex에 값이 작은 인덱스를 뽑아서 다음 게시물의 사이즈를 넣어준다.
  List<int> groupIndex = [0, 0, 0];
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 100; i++) {
      var gi = groupIndex.indexOf(min(groupIndex)!);
      var size = 1;
      if (gi != 1) {
        size = Random().nextInt(100) % 2 == 0 ? 1 : 2;
      }
      groupBox[gi].add(size);
      groupIndex[gi] += size;
    }
  }

  Widget _appBar() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              // Get.to(const SearchFocus());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchFocus(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              margin: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: const Color(0xffefefef),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search),
                  Text(
                    "검색",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff838383),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Icon(Icons.location_pin),
        ),
      ],
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          groupBox.length,
          (index) => Expanded(
            child: Column(
              children: List.generate(
                groupBox[index].length,
                (jndex) => Container(
                  height: Get.width * 0.33 * groupBox[index][jndex],
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://blog.kakaocdn.net/dn/0mySg/btqCUccOGVk/nQ68nZiNKoIEGNJkooELF1/img.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ).toList(),
            ),
          ),
        ).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _appBar(),
            Expanded(
              child: _body(),
            )
          ],
        ),
      ),
    );
  }
}
