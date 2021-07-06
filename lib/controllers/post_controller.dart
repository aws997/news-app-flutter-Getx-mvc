import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvc/models/post.dart';
import 'package:getx_mvc/services/post_service.dart';
import 'package:getx_mvc/utils/user_storage.dart';
import 'package:getx_mvc/views/screens/post.dart';
import 'package:image_picker/image_picker.dart';

class PostController extends GetxController {

Rx<List<PostModel>> posts=Rx<List<PostModel>>([]);
RxBool isLoading=false.obs
;
final PostService postService=PostService();

  // For Pagination
ScrollController scrollController = ScrollController();
var isMoreDataAvailable = true.obs;
int page=1;


late Rx<PostModel> openedPost;

Future<String?> pickImage()async
{
    final _picker = ImagePicker();
    PickedFile? pickedFile = await _picker.getImage(source: ImageSource.gallery);
   return pickedFile?.path;

    
}

@override
  void onInit() {
    super.onInit();

  

    getPosts();
    homePagination();


    
  }



    void homePagination() {
    scrollController.addListener(() {
      if (scrollController.offset>=
          scrollController.position.maxScrollExtent) {
        page++;
        getPosts();
      }
    });
  }


getPosts(){
  isLoading(true);
  
 postService.getPosts(page).then((resultsPosts) {
  
   
     this.posts.value.addAll(resultsPosts);
   
     
        isLoading(false);
 
    });
}

createPost(String title,String body) async{
 String? _path=await  pickImage();
 PostModel? newPost=await postService.create(map: {"title":title,"body":body},imagePath: _path!);
if(newPost!=null)
{
  posts.value.insert(0,newPost);
  posts.refresh();
  Get.back();

}
print(posts);
}

likePost(String id)async{
String? _userId=UserStorage().userId;
if(_userId==null)
{
  Get.snackbar("Not loggedin", "Please login to like the post");
  return;
}

await postService.likePost(id);

openedPost.value.liked=!openedPost.value.liked;
if(openedPost.value.likes.contains(_userId))
{
 openedPost.value.likes.remove(_userId);
}
else
{
  openedPost.value.likes.add(_userId);
}
openedPost.refresh();
}

openPostDetail(PostModel _post){
 
  openedPost=Rx<PostModel>(_post);
   openedPost.value.liked=_post.likes.contains(UserStorage().userId);
Get.to(()=> PostPage());
}
}

