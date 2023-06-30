import 'package:flutter/material.dart';
import 'package:instagram_clone/view/widgets/avatarWidget.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user, required this.description});
  final String user;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: 150,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 15,
            left: 15,
            top: 0,
            bottom: 0,
            child: Container(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const AvatarWidget(
                    thumbPath:
                        "https://blog.kakaocdn.net/dn/0mySg/btqCUccOGVk/nQ68nZiNKoIEGNJkooELF1/img.jpg",
                    type: AvatarType.TYPE2,
                    size: 80,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text("Follow"))
                ],
              ),
            ),
          ),
          Positioned(
            right: 5,
            top: 5,
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.close,
                size: 14,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
