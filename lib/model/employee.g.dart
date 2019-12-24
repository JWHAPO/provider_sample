// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) {
  return Employee(
    json['id'] as String,
    json['employee_name'] as String,
    json['employee_salary'] as String,
    json['employee_age'] as String,
  );
}

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'employee_name': instance.employeeName,
      'employee_salary': instance.employeeSalary,
      'employee_age': instance.employeeAge,
    };
