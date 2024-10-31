import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profiles/app/widgets/card.dart';
import 'package:profiles/app/widgets/dropdownlist.dart';

class UsersListView extends GetView{

   final TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
      final RxBool isSearching = false.obs;

    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text("Users Profiles"),
        actions: [
          Row(
            children: [
              // Search TextField within an Obx widget
              Obx(() => isSearching.value
                  ? Expanded(
                      child: TextField(
                        controller: searchController,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: "Search user...",
                          border: InputBorder.none,
                        ),
                        onChanged: (query) {
                          controller.searchUsers(
                              query); // Call the search method in controller
                        },
                      ),
                    )
                  : Container()),
              // Search icon button to toggle search visibility
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  isSearching.value = !isSearching.value;
                },
              ),
              SizedBox(width: 10,),
              MyDropdownlist(),
            ],
          ),
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
