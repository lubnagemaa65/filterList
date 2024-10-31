import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:profiles/app/core/services/services.dart';
import 'package:profiles/app/modules/usersList/bindings/users_list_binding.dart';

import 'app/routes/app_pages.dart';

void main() {
  configureDependencies();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "profiles",
      initialRoute: AppPages.INITIAL,
      initialBinding: UsersListBinding(),
      getPages: AppPages.routes,
    ),
  );
}
