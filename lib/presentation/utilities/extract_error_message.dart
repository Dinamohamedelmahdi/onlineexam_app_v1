import 'package:onlineexam_app_v1/domain/Result.dart';

String extractErrorMessage(Exception? exception){
  String message="something went wrong";
  if(exception is NoInternetConnection){
    message="please check internet connection";
  }else if (exception is ServerError){
    message=exception.serverMessage ??"something went wrong";
  }else if(exception is DioHttpException){
    message=exception.exception?.message??"something went wrong";
  }
  return message;
}