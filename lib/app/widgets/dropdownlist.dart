import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profiles/app/modules/usersList/controllers/users_list_controller.dart';

class MyDropdownlist extends GetView<UsersListController> {
  MyDropdownlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton<String>(
        value:
            controller.selectedGender.value, // Use controller's selectedGender
        icon: Icon(Icons.filter_list),
        dropdownColor: Colors.white,
        onChanged: (String? newValue) {
          if (newValue != null) {
            controller.applyGenderFilter(
                newValue); // Update and apply filter in controller
          }
        },
        items: <String>['All', 'Female', 'Male']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
