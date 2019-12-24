import 'package:provider_sample/model/employee.dart';
import 'package:http/http.dart' as http;
import 'package:provider_sample/state/employee.dart';

import 'dart:convert';
import 'dart:async';

class Api{
  static Future<List<Employee>> getEmployees() async {
    String _jsonResponse = "";
    try{
      http.Response response =
      await http.get(Uri.encodeFull('http://dummy.restapiexample.com/api/v1/employees'), headers: {"Content-type": "application/json", });

      if(response.statusCode == 200){
        _jsonResponse = utf8.decode(response.bodyBytes);
        List<dynamic> res = jsonDecode(_jsonResponse);
        List<Employee> data = [];

        for(var i=0; i<res.length; i++){
          var employee = Employee.fromJson(res[i]);
          data.add(employee);
        }

        return data;
      }else{
        //To Do 에러처리
        return null;
      }

    } on TimeoutException catch (e) {
      print('TimeoutException$e');
      return null;
    } on Error catch (e){
      print('Error$e');
      return null;
    }
  }
}