import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:onlineexam_app_v1/data/api/apiconstants.dart';
import 'package:onlineexam_app_v1/data/api/model/response/authhresponse.dart';
import 'package:onlineexam_app_v1/data/api/model/response/userdto.dart';

import '../../domain/models/user.dart';
import 'model/request/registerrequest.dart';


@singleton
class ApiManager {

 late Dio _dio ;
ApiManager(){_dio= Dio(BaseOptions(baseUrl:ApiConstants.baseUrl));

_dio.interceptors.add(LogInterceptor(
 responseHeader: true,
 requestHeader: true,
 responseBody: true,
 requestBody: true,
 logPrint: (object) {
  debugPrint("Api -> $object");
 },
));
}


Future<AuthResponse?> login(String email, String password) async
 {
 var response = await _dio.post(ApiConstants.signInApi,data:
 {
  "email": email ,
  "password":password

 });
 var authResponse = AuthResponse.fromJson(response.data);

return authResponse ;



 }

 Future<AuthResponse?>register(RegisterRequest registerRequest) async {

  var response=await _dio.post(ApiConstants.registerApi,data: registerRequest);
  var authResponse=AuthResponse.fromJson(response.data);
  return authResponse;
 }









}