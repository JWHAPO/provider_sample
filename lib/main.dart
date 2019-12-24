import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/state/employee.dart';
import 'package:provider_sample/api.dart';
import 'package:provider_sample/model/employee.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EmployeesState>.value(
      value: EmployeesState(),
      child: MaterialApp(
        title: 'Flutter Provider Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final EmployeesState employeesState = Provider.of<EmployeesState>(context);
    print('111');
    if(employeesState.listEmployees== null)employeesState.getEmployees();

    
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Provider Sample'),
      ),
      body: Container(
        child: employeesState.listEmployees != null ?
          ListView.builder(
            itemCount: employeesState.listEmployees.length,
            itemBuilder: (BuildContext context, int index){
              return employeeCard(employeesState.listEmployees[index]);
            },
          ) : Center(
          child: CircularProgressIndicator(),
        )
      )
    );
  }

  Widget employeeCard(Employee employee){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        elevation: 0.9,
        color: Color(0xFFECECEC),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(employee.employeeName, style: TextStyle(color: Colors.black, fontSize: 20.0),),
            Text(employee.employeeSalary, style: TextStyle(color: Colors.grey, fontSize: 14.0),),
          ],
        ),
      ),
    );
  }
}

