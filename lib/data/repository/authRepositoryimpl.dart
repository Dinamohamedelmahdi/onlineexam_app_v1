import 'package:injectable/injectable.dart';
import 'package:onlineexam_app_v1/data/contracts/auth/authofflinedatasource.dart';
import 'package:onlineexam_app_v1/data/contracts/auth/authonlinedatasource.dart';
import 'package:onlineexam_app_v1/domain/models/user.dart';
import 'package:onlineexam_app_v1/domain/repository/authrepository.dart';

import '../../domain/common/apiresults.dart';



@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository
{

  Authonlinedatasource onlineDataSource ;
  AuthOfflineDataSource offlineDataSource ;
  AuthRepositoryImpl(this.onlineDataSource,this.offlineDataSource);
  @override
  Future<Result<User?>>login(String email, String password) {
 return onlineDataSource.login(email, password);
  }
  @override
  Future<Result<User?>>register(String username, String firstname, String lastname, String email,
      String phone, String password, String rePassword) {
return onlineDataSource.register(username, firstname, lastname, email, phone, password, rePassword)
;  }




}