import 'package:flutter/material.dart';
import 'package:instagram_clone/view/widgets/avatarWidget.dart';
import 'package:instagram_clone/view/widgets/myStroy.dart';

class StoryBoardList extends StatelessWidget {
  const StoryBoardList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          const MyStroy(),
          const SizedBox(
            width: 5,
          ),
          ...List.generate(
            100,
            (index) => const AvatarWidget(
                thumbPath:
                    'https://blog.kakaocdn.net/dn/0mySg/btqCUccOGVk/nQ68nZiNKoIEGNJkooELF1/img.jpg',
                type: AvatarType.TYPE1),
          ),
        ],
      ),
    );
  }
}
