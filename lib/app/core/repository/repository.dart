import 'package:injectable/injectable.dart';
import 'package:profiles/app/core/services/apiService.dart';

@injectable
class UserRepository {
  final ApiService apiService;

  UserRepository(this.apiService);

  Future<void> getUserData() async {
    await apiService.fetchData();
  }
}
