import 'package:onlineexam_app_v1/domain/Result.dart';

import '../model/User.dart';

abstract class AuthRepository{
  Future<Result<User?>>login (String email,String password);
  Future<Result<User?>> register (
  String username,
  String firstName,
  String lastName,
  String email,
  String password,
  String rePassword,
  String phone,
      );
}