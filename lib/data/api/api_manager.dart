import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:onlineexam_app_v1/data/api/api_constants.dart';
import 'package:onlineexam_app_v1/data/api/api_model/AuthResponse.dart';
import 'package:onlineexam_app_v1/data/api/api_model/RegisterRequest.dart';


@singleton

class ApiManager{
late Dio _dio;
ApiManager(){
  _dio =Dio(BaseOptions(
      baseUrl:ApiConstants.baseUrl
  ));
}
Future<AuthResponse?>login(String email,String password) async {
    var response=await _dio.post(ApiConstants.signInApi,data: {
      "email":email,
      "password":password
    });
    var authResponse=AuthResponse.fromJson(response.data);
    return authResponse;

}

Future<AuthResponse?>register(RegisterRequest registerRequest) async {

  var response=await _dio.post(ApiConstants.registerApi,data: registerRequest);
  var authResponse=AuthResponse.fromJson(response.data);
  return authResponse;
}



}