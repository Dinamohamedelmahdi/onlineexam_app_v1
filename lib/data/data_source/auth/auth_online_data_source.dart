import '../../../domain/Result.dart';
import '../../../domain/model/User.dart';

abstract class AuthOnlineDataSource{
  Future<Result<User?>> login (String email,String password);
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
