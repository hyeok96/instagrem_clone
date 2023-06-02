import 'package:flutter/material.dart';
import 'package:instagram_clone/view/widgets/avatarWidget.dart';

class MyStroy extends StatelessWidget {
  const MyStroy({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const AvatarWidget(
          thumbPath:
              "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F210CE13D553EE2A632",
          type: AvatarType.TYPE2,
          size: 70,
        ),
        Positioned(
          right: 5,
          bottom: 0,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Center(
              child: Text(
                "+",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  height: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
