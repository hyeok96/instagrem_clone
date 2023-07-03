import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/constants/icon_path.dart';
import 'package:instagram_clone/controllers/uploadController.dart';
import 'package:instagram_clone/util/image_data.dart';
import 'package:photo_manager/photo_manager.dart';

class UploadScreen extends GetView<UploadController> {
  const UploadScreen({super.key});

  Widget _imagePreview() {
    var width = Get.width;
    return Obx(
      () => Container(
          width: width,
          height: width,
          color: Colors.grey,
          child: controller.selectedImage.value == null
              ? Container()
              : _photoWidget(
                  controller.selectedImage.value!, width.toInt(), true)),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: Get.context!,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                // isScrollControlled: true,
                // constraints: BoxConstraints(
                //     maxHeight: MediaQuery.of(context).size.height -
                //         MediaQuery.of(context).padding.top),
                builder: (context) => SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black54,
                          ),
                          width: 40,
                          height: 4,
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: List.generate(
                              controller.albums.length,
                              (index) => GestureDetector(
                                onTap: () {
                                  controller
                                      .changeAlbum(controller.albums[index]);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 20),
                                  child: Text(controller.albums[index].name),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Obx(
                    () => Text(
                      controller.headerTitle.value,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff808080),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  children: [
                    ImageData(icon: IconPath.imageSelectIcon),
                    const SizedBox(
                      width: 7,
                    ),
                    const Text(
                      "여러 항목 선택",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff808080),
                ),
                child: ImageData(icon: IconPath.cameraIcon),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _imageSelectList() {
    return Obx(
      () => GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 1,
        ),
        itemCount: controller.imageList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                controller.changeSelectedImage(controller.imageList[index]);
              },
              child: _photoWidget(controller.imageList[index], 200, false));
        },
      ),
    );
  }

  Widget _photoWidget(AssetEntity asset, int size, bool previewType) {
    return FutureBuilder(
      future: asset.thumbnailDataWithSize(ThumbnailSize(size, size)),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // Unit8List 타입을 사용을 할 때
          return Obx(() => Opacity(
                opacity:
                    (asset == controller.selectedImage.value && !previewType)
                        ? 0.3
                        : 1,
                child: Image.memory(
                  snapshot.data!,
                  fit: BoxFit.cover,
                ),
              ));
        } else {
          return Container();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: Get.back,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ImageData(
              icon: IconPath.closeImage,
            ),
          ),
        ),
        title: const Text(
          "New Post",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageData(
                icon: IconPath.nextImage,
                width: 50,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _imagePreview(),
            _header(),
            _imageSelectList(),
          ],
        ),
      ),
    );
  }
}
