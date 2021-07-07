import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvc/controllers/post_controller.dart';
import 'package:getx_mvc/models/post.dart';

class PostWidget extends StatelessWidget {
  
  final PostModel post;

  const PostWidget({Key? key,required this.post}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    PostController postController =Get.find();

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8
      ),
  
      height: 130,
      child: Material(
        elevation: 6,
        shadowColor: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: (){
postController.openPostDetail(this.post);
      },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
               
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(15),
                //   child: Image.network(ApiUtils.host+'/${post.image}',
                //   height: 130,
                //   width: 140,
                //   fit: BoxFit.cover,),
                // ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(post.title,
                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        SizedBox(height:5,),
                        Expanded(
                          child: Text(post.body,
                          style: TextStyle(fontSize: 13,color: Colors.grey[600]),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}