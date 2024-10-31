import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profiles/app/modules/usersList/controllers/users_list_controller.dart';
import 'package:profiles/app/widgets/card.dart';
import 'package:profiles/app/widgets/dropdownlist.dart';

class UsersListView extends GetView<UsersListController> {
  final UsersListController usersListController =
      Get.put(UsersListController());
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text("Users Profiles"),
        actions: [
          // Dropdown for selecting gender filter
          Obx( () =>MyDropdownlist()  ),
        ],
      ),
      body: Obx(() {
        // Display loading indicator while data is loading
        if (controller.users.isEmpty &&
            controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          controller: controller.scrollController,
          itemCount: controller.users.length +
              1, // +1 for loading indicator at the end
          itemBuilder: (context, index) {
            if (index < controller.users.length) {
              final user = controller.users[index];

              // Concatenate first and last name safely
              final fullName =
                  (user.name.first) + ' ' + (user.name.last);

              // Print image URL for debugging
              print("Loading image from URL: ${user.picture}");

              return MyCard(user: user, fullName: fullName, picture: user.picture) ;
                    // Show loading indicator at the bottom while more data is loading
            } else {
              // Show end-of-list message
              return Center(child: Text("No more data"));
            }
          },
        );
      }),
    );
  }
}
