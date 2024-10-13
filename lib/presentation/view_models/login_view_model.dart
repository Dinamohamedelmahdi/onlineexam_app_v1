
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:onlineexam_app_v1/domain/usecase/login_use_case.dart';

import '../../domain/Result.dart';
import '../../domain/model/User.dart';

@injectable

class LoginViewModel extends Cubit<LoginHomeState> {
  LoginUseCase loginUseCase;

  LoginViewModel(this.loginUseCase) : super(LoginInitialState());



  void login(String email,String password)async {
    emit(LoginLoadingState());
    try{
      var result =await loginUseCase.invoke(email, password);
      switch(result){

        case Success<User?>():{
          emit(LoginSuccessState(result.data));
        }
        case Fail<User?>():{
          emit(LoginErrorState(result.exception));
        }
        default: emit(LoginErrorState(Exception("Unexpected error")));

      }
    }catch(e){
      emit(LoginErrorState(Exception(e.toString())));
    }

  }
}

sealed class LoginHomeState {}

class LoginInitialState extends LoginHomeState{}

class LoginLoadingState extends LoginHomeState {}

class LoginSuccessState extends LoginHomeState {
  User? user;
  LoginSuccessState(this.user);

}

class LoginErrorState extends LoginHomeState {
  Exception? exception;
  LoginErrorState(this.exception);
}
