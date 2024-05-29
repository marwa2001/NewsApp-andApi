

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=9a711dd016b243fb971e1783a9650902
//
class DioHelper{

  static Dio? dio;
  static init(){
dio=Dio(
  BaseOptions(
  baseUrl:"https://newsapi.org/",
    receiveDataWhenStatusError:true ,
),
);
  }
   static Future<Response?> getData({
    required String url,
     //Map <String,dynamic> بيحتاج query
    required Map <String,dynamic> query,
}) async{
  return await  dio?.get(
  url,
  queryParameters:query
    );
  }
}