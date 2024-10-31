
//in this file instead of return null data we throw an exception
import 'package:profiles/app/network/models/error_model';

class ServerException implements Exception {
  final ErrorMsgModel errorMsgModel;
  ServerException({
    required this.errorMsgModel,
  });
}

//if we want to work with local data source we can add:
class LocalDataBaseException implements Exception {
  final String mssg;
  LocalDataBaseException({
    required this.mssg,
  });
}
