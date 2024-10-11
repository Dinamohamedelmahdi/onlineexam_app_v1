import 'package:injectable/injectable.dart';
import 'package:onlineexam_app_v1/domain/repository/auth_repository.dart';

import '../Result.dart';
import '../model/User.dart';

@injectable
class RegisterUseCase {
  AuthRepository authRepository;
  RegisterUseCase(this.authRepository);

  Future<Result<User?>> invoke(
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
  ) {
    return authRepository.register(
      username,
      firstName,
      lastName,
      email,
      password,
      rePassword,
      phone,
    );
  }
}
