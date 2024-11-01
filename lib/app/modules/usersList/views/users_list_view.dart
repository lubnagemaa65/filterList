import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profiles/app/modules/usersList/controllers/users_list_controller.dart';
import 'package:profiles/app/widgets/card.dart';
import 'package:profiles/app/widgets/dropdownlist.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class UsersListView extends GetView<UsersListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Obx(() {
          // Toggle between title and search field based on `isSearching` value
          return controller.isSearching.value
              ? TextField(
                  controller: controller.searchController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "Search user...",
                    border: InputBorder.none,
                  ),
                  onChanged: (query) {
                    controller.searchUsers(query);
                    // Implement your search method here
                    // Example: controller.searchUsers(query);
                  },
                )
              : Text("Users Profiles");
        }),
        actions: [
          IconButton(
            icon:
                Icon(controller.isSearching.value ? Icons.close : Icons.search),
            onPressed: () {
              // Toggle the search mode
              controller.isSearching.value = !controller.isSearching.value;
              if (!controller.isSearching.value) {
                // Clear the search field and reset any filters if search is closed
                controller
                    .searchUsers(''); // Reset the list when search is closed
                // Reset search/filter results here if needed
              }
            },
          ),
          MyDropdownlist(),
        ],
      ),
      body: Obx(() {
        // Display loading indicator while data is loading
        if (controller.users.isEmpty && controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return AnimationConfiguration.staggeredList(
          position: 1,
          duration: const Duration(milliseconds: 375),
          child: ListView.builder(
            controller: controller.scrollController,
            itemCount: controller.filteredUsers.isNotEmpty
                ? controller.filteredUsers.length
                : controller.users.length +
                    1, // Dynamic item count based on filtering
            itemBuilder: (context, index) {
              if (index <
                  (controller.filteredUsers.isNotEmpty
                      ? controller.filteredUsers.length
                      : controller.users.length)) {
                final user = controller.filteredUsers.isNotEmpty
                    ? controller.filteredUsers[index]
                    : controller.users[index];

                final fullName = "${user.name.first} ${user.name.last}";

                // Print image URL for debugging
                print("Loading image from URL: ${user.picture}");

                return SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: MyCard(
                        user: user, fullName: fullName, picture: user.picture),
                  ),
                );
              } else {
                // Show end-of-list message
                return Center(child: Text("No more data"));
              }
            },
          ),
        );
      }),
    );
  }
}
