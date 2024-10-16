
import 'package:injectable/injectable.dart';
import 'package:onlineexam_app_v1/domain/Result.dart';
import 'package:onlineexam_app_v1/domain/repository/auth_repository.dart';

import '../model/User.dart';

@injectable
class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase(this.authRepository);

  Future<Result<User?>> invoke(String email,String password){
 return authRepository.login(email, password) ;
  }
}
