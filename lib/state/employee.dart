import 'package:flutter/foundation.dart';
import 'package:provider_sample/model/employee.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

class EmployeesState extends ChangeNotifier{
  List<Employee> _employees;
  List<Employee> get listEmployees => _employees;

  Employee _employee;
  Employee get detailEmployee => _employee;

  set detailEmployee(Employee val){
    _employee = val;
    notifyListeners();
  }

  set listEmployees(List<Employee> val){
    _employees = val;
    print('set listEmployees');
    notifyListeners();
  }

  Future<Employee> getEmployee(String id) async {
    String _jsonResponse = "";
    try{
      http.Response response =
      await http.get(Uri.encodeFull('http://dummy.restapiexample.com/api/v1/employee/$id'), headers: {"Content-type": "application/json", });

      if(response.statusCode == 200){
        _jsonResponse = utf8.decode(response.bodyBytes);
        Employee employee = Employee.fromJson(jsonDecode(_jsonResponse));
        detailEmployee = employee;
        return employee;
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

  Future<List<Employee>> getEmployees() async {
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
        listEmployees = data;
        return listEmployees;
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