import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvc/controllers/auth_controller.dart';
import 'package:getx_mvc/controllers/user_controller.dart';
import 'package:getx_mvc/utils/api_utils.dart';
import 'package:getx_mvc/utils/user_storage.dart';
import 'package:getx_mvc/views/screens/login.dart';

class Profile extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {

    userController.getUser(UserStorage().userId ?? '');

    return Column(
      children: [
        Obx(() {

          //show profile only if the user is logged in
          if (authController.isLoggedIn.value)
            return profileWidget();
          else
            return Container();
        }),

        login_logoutButton()
      ],
    );
  }
Widget login_logoutButton(){

return Obx(() {
          if (authController.isLoggedIn.value)
            return ElevatedButton(
                onPressed: () {
                  authController.logout();
                },
                child: Text("LOGOUT"));
          else
            return ElevatedButton(
                onPressed: () {
                  Get.to(() => LoginScreen());
                },
                child: Text("LOGIN"));
        });
}
  Widget profileWidget() {
    return SafeArea(
      child: Obx(() {
        if (!userController.isLoading.value)
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Material(
              color: Colors.white,
              elevation: 7,
              shadowColor: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
              child: Padding(
                padding: const EdgeInsets.all(9),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// profile image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: userController.user!.value.profilePic.length > 0
                          ? Image.network(ApiUtils.host +
                              '/${userController.user!.value.profilePic}')
                          : Image.asset(
                              'images/profilePic.PNG',
                              width: 140,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                    ),

                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),

                          //// username
                          Text(
                            userController.user!.value.username,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Senior Journalist",
                            style: TextStyle(
                                color: Colors.blueGrey.withOpacity(0.8),
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xfff1f5f9),
                                borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                           
                                infoColumn("Articles", "26"),
                                infoColumn(
                                    "Followings",
                                    userController.user!.value.followers.length.toString()),
                                infoColumn("Rating", "8.9")
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        else
          return CircularProgressIndicator();
      }),
    );
  }

  Widget infoColumn(String title, String count) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.blueGrey, fontSize: 13),
        ),
        Text(
          count,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }
}
