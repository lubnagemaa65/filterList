import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:profiles/app/models/pictureModel.dart';
import 'package:profiles/app/models/usersModel.dart';
import 'package:flutter/material.dart';

class UsersListController extends GetxController {
  
  final Dio _dio = Dio();
  final ScrollController scrollController = ScrollController();
  var isLoading = false.obs;
  var page = 1;
  var hasMoreData = true.obs;
  var users = <Users>[].obs;
    var picture = <Picture>[].obs;

  var selectedGender = 'male'; // Default gender

  @override
  void onInit() {
    
    super.onInit();
    fetchData(); // Initial data fetch
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 100 &&
          !isLoading.value &&
          hasMoreData.value) {
        fetchData(); // Fetch next page when scrolled near bottom
      }
    });
  }

  Future<void> fetchData({String? gender}) async {
    if (isLoading.value) return;

    isLoading.value = true;

    try {
      final response = await _dio.get(
        'https://randomuser.me/api/?page=$page&results=10&gender=${gender ?? selectedGender}',
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['results'];
        if (data.isNotEmpty) {
          users.addAll(
              data.map((userData) => Users.fromJson(userData)).toList());
          page++;
        } else {
          hasMoreData.value = false; // No more data to fetch
        }
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void applyGenderFilter(String gender) {
    selectedGender = gender.toLowerCase();
    users.clear();
    page = 1;
    hasMoreData.value = true;
    fetchData();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
