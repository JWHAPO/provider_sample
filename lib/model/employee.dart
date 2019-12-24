import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable()
class Employee{
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'employee_name')
  String employeeName;
  @JsonKey(name: 'employee_salary')
  String employeeSalary;
  @JsonKey(name: 'employee_age')
  String employeeAge;

  Employee(this.id, this.employeeName, this.employeeSalary, this.employeeAge);

  factory Employee.fromJson(Map<String, dynamic> json) => _$EmployeeFromJson(json);
  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}