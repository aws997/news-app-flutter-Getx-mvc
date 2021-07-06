import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvc/controllers/auth_controller.dart';
import 'package:getx_mvc/controllers/post_controller.dart';
import 'package:getx_mvc/models/post.dart';
import 'package:getx_mvc/views/widgets/post.dart';

class PostsScreen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    PostController controller = Get.put(PostController());
    return Column(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,top: 50,
              bottom: 8
            ),
            child: Text("Good\nmorning",
            style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          ),
        ),
       
         Expanded(
          child: Obx(() {
            if (controller.isLoading.value)
              return Center(child: CircularProgressIndicator());
            else
              return ListView.builder(
                padding: const EdgeInsets.all(0),
                  itemCount: controller.posts.value.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PostWidget(post:controller.posts.value[index]);
                  });
          }),
        ),
      ],
    );
  }
}
