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
                    'https://scontent-ssn1-1.xx.fbcdn.net/v/t39.30808-6/302126321_823739655664412_8886132852838745167_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=S_XQyP8hTKYAX_yaS3g&_nc_ht=scontent-ssn1-1.xx&oh=00_AfAhrfLfJYN9tYqSrc1OnqO-RnrQg7O-JYB1p6dvSRK1ug&oe=647DA1CE',
                type: AvatarType.TYPE1),
          ),
        ],
      ),
    );
  }
}
