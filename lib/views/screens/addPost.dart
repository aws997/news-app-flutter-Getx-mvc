import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvc/controllers/post_controller.dart';

class AddPost extends StatelessWidget {

final TextEditingController titleController= TextEditingController();
final TextEditingController bodyController= TextEditingController();

GlobalKey<FormState> _formkey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    PostController controller=Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25
          ),
          child: Column(children: [
                  Obx(
                  ()=> SizedBox(
                    height: 35,
                    width: 35,
                      child: controller.isLoading.value
                          ? CircularProgressIndicator()
                          : Container()),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: titleController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Title",
                      alignLabelWithHint: true,
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      filled: true),
                  validator: (String? s) {
                    if (s == null || s.length <= 0) return "Title is required";
                    else
                      return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: bodyController,
                 maxLines: 6,
                 minLines: 3,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Body",
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      filled: true),
                  validator: (String? s) {
                    if (s == null || s.length <= 0) return "Body is required";

                    else
                      return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
               
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      controller.createPost(
                          titleController.text, bodyController.text);
                    }
                  },
                  child: Text(
                    "Create",
                  ),
                )
          ],),
        ),
      ),),
    );
  }
}