import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';


class NetworkResponse{
  final int statusCode;
  final Map<String,dynamic> ?responseData; // Map<String,dynamic keno>
  final String errorMessage;
  final bool isSuccess;
NetworkResponse({required this.statusCode,
 this.responseData,
  required this.isSuccess,
   this.errorMessage = 'something went wrong',
});
}


class NetworkCaller{
//get request
// Map <String,dynamic> kno
static  Future <NetworkResponse> getRequest({required Map<String,dynamic> params,required String url})async{
 try{ Uri uri= Uri.parse(url);
 debugPrint("Uri = $url");
    Response response =await get(uri);
    if (response.statusCode==200){
      debugPrint("status = ${response.statusCode}");
      debugPrint("body = ${response.body}");
      final decodedData= jsonDecode(response.body);
      return NetworkResponse(
        isSuccess: true,
        statusCode: response.statusCode,
          responseData: decodedData,);
    } else {
      return NetworkResponse(
        isSuccess: true,
        statusCode: response.statusCode,
       // responseData: decodedData,   akhane decoded data keno ney ni
      );
    }
  }catch(e){
   return NetworkResponse(statusCode: -1,
       isSuccess: false,
       errorMessage: e.toString());
 }
  }
//post request
static  Future <NetworkResponse> postRequest({required Map<String,dynamic> body,required String url})async{
    try{ Uri uri= Uri.parse(url);
      debugPrint("Uri = $url");
    //debugPrint("Uri = $body");
    Response response =await post(uri,
        headers: {'content-type': 'application/json'},
        body:jsonEncode(body) );
    if (response.statusCode==200){
      debugPrint("status = ${response.statusCode}");
      final decodedData= jsonDecode(response.body);
      return NetworkResponse(
        isSuccess: true,
        statusCode: response.statusCode,
        responseData: decodedData,);
    } else {
      return NetworkResponse(
        isSuccess: true,
        statusCode: response.statusCode,
        // responseData: decodedData,   akhane decoded data keno ney ni
      );
    }
    }catch(e){
      return NetworkResponse(statusCode: -1,
          isSuccess: false,
          errorMessage: e.toString());
    }
  }


}