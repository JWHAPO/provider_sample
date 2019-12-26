import 'package:flutter/material.dart';
import 'package:provider_sample/state/employee.dart';
import 'package:provider_sample/model/employee.dart';
import 'package:provider/provider.dart';

class EmployeeDetail extends StatelessWidget {
  final String id;
  EmployeeDetail(this.id);

  @override
  Widget build(BuildContext context) {

    final EmployeesState employeesState = Provider.of<EmployeesState>(context);
    if(employeesState.detailEmployee == null) employeesState.getEmployee(id);

    Employee employee = employeesState.detailEmployee;

    return Scaffold(
      appBar: AppBar(
        title: Text(employee!=null?employee.employeeName:''),
      ),
      body: Center(
        child: Text(employee!=null?employee.employeeSalary:''),
      ),
    );
  }
}
