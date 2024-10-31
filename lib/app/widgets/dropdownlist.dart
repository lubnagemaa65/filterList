import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profiles/app/modules/usersList/controllers/users_list_controller.dart';

class MyDropdownlist extends GetWidget<UsersListController> {
   MyDropdownlist({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    final RxString selectedGender = 'All'.obs;

    return        DropdownButton<String>(
                value: selectedGender.value,
                icon: Icon(Icons.filter_list),
                dropdownColor: Colors.white,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    selectedGender.value = newValue;
                    controller.applyGenderFilter(newValue);
                  }
                },
                items: <String>['All', 'Female', 'Male']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              );
    
  }
}