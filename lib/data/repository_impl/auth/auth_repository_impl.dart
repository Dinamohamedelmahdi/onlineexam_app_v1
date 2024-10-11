import 'package:injectable/injectable.dart';
import 'package:onlineexam_app_v1/data/data_source/auth/auth_offline_data_source.dart';
import 'package:onlineexam_app_v1/data/data_source/auth/auth_online_data_source.dart';
import 'package:onlineexam_app_v1/domain/model/User.dart';
import 'package:onlineexam_app_v1/domain/repository/auth_repository.dart';

import '../../../domain/Result.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository{
  AuthOnlineDataSource onlineDataSource;
  AuthOfflineDataSource offlineDataSource;

  AuthRepositoryImpl(this.offlineDataSource,this.onlineDataSource);

  @override
  Future<Result<User?>>login(String email, String password) {

    return onlineDataSource.login(email, password);
  }

  @override
  Future<Result<User?>> register(
      String username,
      String firstName,
      String lastName,
      String email,
      String password,
      String rePassword,
      String phone) {

    return onlineDataSource.register(username, firstName, lastName, email, password, rePassword, phone);
  }
  
}