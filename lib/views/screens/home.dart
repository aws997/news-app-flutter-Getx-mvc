import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvc/controllers/home_controller.dart';
import 'package:getx_mvc/views/screens/addPost.dart';
import 'package:getx_mvc/views/screens/posts.dart';
import 'package:getx_mvc/views/screens/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

final List<Widget> pages= [
  PostsScreen(),
  Profile()
];

  @override
  Widget build(BuildContext context) {
   
    HomeController homeController = Get.put(HomeController());


    return Scaffold(
      

      backgroundColor: Color(0xffe8eaee),

      body:Center(
        child: Obx(()=>
         pages[homeController.currentIndex.value]),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create),
        onPressed: () {
          Get.to(() => AddPost());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      bottomNavigationBar:
       Obx(
      () => 
      BottomNavigationBar(
        onTap: (int index) {
          homeController.setIndex(index);
        },
        currentIndex: homeController.currentIndex.value,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
             label: "Profle")
        ],
      ),
    )
    );
  }
}
