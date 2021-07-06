import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvc/controllers/post_controller.dart';
import 'package:getx_mvc/models/post.dart';
import 'package:getx_mvc/utils/api_utils.dart';
import 'package:intl/intl.dart' as intl;

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PostController postController = Get.find();
    PostModel _post = postController.openedPost.value;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(ApiUtils.host + '/${_post.image}')),
              ),
              Text(
                _post.title,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_post.username),
                        Text(
                          intl.DateFormat.yMMMMd()
                              .format(_post.createdAt)
                              .toString(),
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(() => Text(
                              postController.openedPost.value.likes.length
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                        IconButton(
                            icon: Obx(() => Icon(
                                  postController.openedPost.value.liked
                                      ? Icons.thumb_up_alt_rounded
                                      : Icons.thumb_up_alt_outlined,
                                  color: Colors.blue,
                                )),
                            onPressed: () {
                              postController.likePost(_post.id);
                            })
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  _post.body,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
