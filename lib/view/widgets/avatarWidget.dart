import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum AvatarType {
  TYPE1,
  TYPE2,
  TYPE3,
}

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    this.hasStory,
    required this.thumbPath,
    this.nickName,
    required this.type,
    this.size = 65,
  });

  final bool? hasStory;
  final String thumbPath;
  final String? nickName;
  final AvatarType type;
  final double? size;

  Widget type1Widget() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.purple,
            Colors.orange,
          ],
        ),
        shape: BoxShape.circle,
      ),
      child: type2Widget(),
    );
  }

  Widget type2Widget() {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size!),
        child: SizedBox(
          width: size,
          height: size,
          child: CachedNetworkImage(
            imageUrl: thumbPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AvatarType.TYPE1:
        return type1Widget();
        break;
      case AvatarType.TYPE2:
        return type2Widget();
        break;
      case AvatarType.TYPE3:
        return Container();
        break;
    }
  }
}
