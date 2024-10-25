import 'package:bloc_api/user_model.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class UserRepo {
  String endPoint = "https://reqres.in/api/users?page=2";

  Dio dio = Dio()..interceptors.addAll([PrettyDioLogger()]);
  Future<UserListModel> getUser() async {
    final response = await dio.get(endPoint);
    final jsonData = UserListModel.fromJson(response.data);
    return jsonData;
  }
}
