import 'package:injectable/injectable.dart';
import 'package:onlineexam_app_v1/data/data_source/auth/auth_offline_data_source.dart';
import 'package:onlineexam_app_v1/domain/model/User.dart';

import '../../domain/Result.dart';

@Injectable(as: AuthOfflineDataSource)
class AuthOfflineDataSourceImpl implements AuthOfflineDataSource {
  @override
  Future<Result<User?>>login(String email, String password) {

    throw UnimplementedError();
  }
  
}