import '../../../domain/Result.dart';
import '../../../domain/model/User.dart';

abstract class AuthOfflineDataSource{
  Future<Result<User?>> login(String email,String password);
}