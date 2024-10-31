import 'package:get/get.dart';

import '../controllers/users_list_controller.dart';

class UsersListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersListController>(
      () => UsersListController(),
    );
  }
}
