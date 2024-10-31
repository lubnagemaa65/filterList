import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<void> fetchData() async {
    try {
      final response = await _dio.get('https://randomuser.me/api/?page=3&results=10&gender=male');

      if (response.statusCode == 200) {
        final List<dynamic> results = response.data['results'];

        List<User> users = results.map((userData) => User.fromJson(userData)).toList();

        // Process the fetched users
        handleFetchedUsers(users);
      } else {
        // Handle HTTP error
        print('Failed to fetch data. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle other errors
      print('Error: $e');
    }
  }

  void handleFetchedUsers(List<User> users) {
    // Further processing of fetched users
    // Example: Storing users in a local database, updating UI, etc.
  }
}

class User {
  final String firstName;
  final String lastName;
  final String email;
  


  User({required this.firstName, required this.lastName, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['name']['first'],
      lastName: json['name']['last'],
      email: json['email'],
    );
  }
}