import 'dart:ui';

import 'package:brave_girls/controllers/auth_controller.dart';
import 'package:brave_girls/resources/resources.dart';
import 'package:brave_girls/utils/routes.dart';
import 'package:brave_girls/utils/ui_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class HomePage extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    UISizeConfig.init(context);

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            Image.asset(
              Assets.werideAlbumCover,
              fit: BoxFit.fitHeight,
            ),
            Container(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(color: Colors.grey.shade200.withOpacity(0.1)),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildImage(Assets.werideMinyoung),
                      buildImage(Assets.werideYoujoung),
                      buildImage(Assets.werideEunji),
                      buildImage(Assets.werideYuna),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: GetX<UserController>(
    //       initState: (_) async {
    //         Get.find<UserController>().user = await Database().getUser(Get.find<AuthController>().user!.uid);
    //       },
    //       builder: (_) {
    //         if (_.user.name != null) {
    //           return Text("Welcome " + _.user.name!);
    //         } else {
    //           return Text("loading...");
    //         }
    //       },
    //     ),
    //     centerTitle: true,
    //     actions: [
    //       IconButton(
    //         icon: Icon(Icons.exit_to_app),
    //         onPressed: () {
    //           controller.signOut();
    //         },
    //       ),
    //       IconButton(
    //         icon: Icon(Icons.edit),
    //         onPressed: () {
    //           if (Get.isDarkMode) {
    //             Get.changeTheme(ThemeData.light());
    //           } else {
    //             Get.changeTheme(ThemeData.dark());
    //           }
    //         },
    //       )
    //     ],
    //   ),
    //   body: Column(
    //     children: <Widget>[
    //       SizedBox(
    //         height: 20,
    //       ),
    //       Text(
    //         "Add Todo Here:",
    //         style: TextStyle(
    //           fontSize: 20,
    //           fontWeight: FontWeight.bold,
    //         ),
    //       ),
    //       Card(
    //         margin: EdgeInsets.all(20),
    //         child: Padding(
    //           padding: const EdgeInsets.all(10.0),
    //           child: Row(
    //             children: [
    //               Expanded(
    //                 child: TextFormField(
    //                   controller: _todoController,
    //                 ),
    //               ),
    //               IconButton(
    //                 icon: Icon(Icons.add),
    //                 onPressed: () {
    //                   if (_todoController.text != "") {
    //                     Database().addTodo(_todoController.text, controller.user!.uid);
    //                     _todoController.clear();
    //                   }
    //                 },
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //       Text(
    //         "Your Todos",
    //         style: TextStyle(
    //           fontSize: 20,
    //           fontWeight: FontWeight.bold,
    //         ),
    //       ),
    //       GetX<TodoController>(
    //         init: Get.put<TodoController>(TodoController()),
    //         builder: (TodoController todoController) {
    //           if (todoController.todos != null) {
    //             return Expanded(
    //               child: ListView.builder(
    //                 itemCount: todoController.todos!.length,
    //                 itemBuilder: (_, index) {
    //                   return TodoCard(uid: controller.user!.uid, todo: todoController.todos![index]);
    //                 },
    //               ),
    //             );
    //           } else {
    //             return Text("loading...");
    //           }
    //         },
    //       )
    //     ],
    //   ),
    // );
  }

  Widget buildImage(String? assetPath) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.member_detail, arguments: {
          "memberName" : 'minyoung'
        });
      },
      child: Container(
        width: 80.s,
        height: 200.s,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.s),
          child: Image.asset(
            assetPath!,
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
