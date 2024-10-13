import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:onlineexam_app_v1/data/api/api_extentions.dart';
import 'package:onlineexam_app_v1/data/api/api_manager.dart';
import 'package:onlineexam_app_v1/data/api/api_model/RegisterRequest.dart';
import 'package:onlineexam_app_v1/domain/model/User.dart';

import '../../domain/Result.dart';
import '../api/api_model/UserDto.dart';
import '../data_source/auth/auth_online_data_source.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceImpl implements AuthOnlineDataSource {
  ApiManager apiManager;

  AuthOnlineDataSourceImpl(this.apiManager);

  @override
  Future<Result<User?>> login(String email, String password) async {

    return executeApi<User?>(() async {
      var authResponse = await apiManager.login(email, password);
      var userDto = UserDto(token: authResponse?.token);
      return userDto.toUser();
    });


  }

  @override
  Future<Result<User?>> register(
      String username,
      String firstName,
      String lastName,
      String email,
      String password,
      String rePassword,
      String phone) async {
    var body = RegisterRequest(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      password: password,
      rePassword: rePassword,
    );

    return executeApi<User?>(() async {
      var response = await apiManager.register(body);
      var userDto = UserDto(token: response?.token);
      return userDto.toUser();
    });

  }
}
