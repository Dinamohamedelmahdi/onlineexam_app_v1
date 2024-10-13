
import 'package:injectable/injectable.dart';
import 'package:onlineexam_app_v1/data/api/apimanager.dart';
import 'package:onlineexam_app_v1/data/contracts/auth/authofflinedatasource.dart';

import '../../../domain/common/apiresults.dart';
import '../../../domain/models/user.dart';

@Injectable(as: AuthOfflineDataSource)
class AuthOffineDataSourceImpl implements AuthOfflineDataSource {

  @override
  Future<Result<User?>> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}