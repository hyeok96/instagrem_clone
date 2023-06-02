import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/icon_path.dart';
import 'package:instagram_clone/util/image_data.dart';
import 'package:instagram_clone/view/widgets/storyBoardList.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: ImageData(
          icon: IconPath.logo,
          width: 270,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ImageData(
                icon: IconPath.directMessage,
                width: 50,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: const [
          StoryBoardList(),
        ],
      ),
    );
  }
}
