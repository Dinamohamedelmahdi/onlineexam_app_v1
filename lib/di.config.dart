// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'data/api/api_manager.dart' as _i405;
import 'data/data_source/auth/auth_offline_data_source.dart' as _i639;
import 'data/data_source/auth/auth_online_data_source.dart' as _i537;
import 'data/data_source_impl/auth_offline_data_source_impl.dart' as _i117;
import 'data/data_source_impl/auth_online_data_source_impl.dart' as _i973;
import 'data/repository_impl/auth/auth_repository_impl.dart' as _i251;
import 'domain/repository/auth_repository.dart' as _i914;
import 'domain/usecase/login_use_case.dart' as _i839;
import 'domain/usecase/register_use_case.dart' as _i293;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i405.ApiManager>(() => _i405.ApiManager());
    gh.factory<_i639.AuthOfflineDataSource>(
        () => _i117.AuthOfflineDataSourceImpl());
    gh.factory<_i537.AuthOnlineDataSource>(
        () => _i973.AuthOnlineDataSourceImpl(gh<_i405.ApiManager>()));
    gh.factory<_i914.AuthRepository>(() => _i251.AuthRepositoryImpl(
          gh<_i639.AuthOfflineDataSource>(),
          gh<_i537.AuthOnlineDataSource>(),
        ));
    gh.factory<_i839.LoginUseCase>(
        () => _i839.LoginUseCase(gh<_i914.AuthRepository>()));
    gh.factory<_i293.RegisterUseCase>(
        () => _i293.RegisterUseCase(gh<_i914.AuthRepository>()));
    return this;
  }
}
