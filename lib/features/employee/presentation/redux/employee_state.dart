import 'package:supy_io_test/features/employee/infrastructure/models/employee_model.dart';

abstract class EmployeeState {
  const EmployeeState();
}

class LoadingState extends EmployeeState {}

class FailureState extends EmployeeState {
  final String message;

  FailureState(this.message);
}

class EmptyState extends EmployeeState {}

class SuccessState extends EmployeeState {
  final List<EmployeeModel>? employeeList;
  final EmployeeModel? employee;

  SuccessState({this.employeeList, this.employee});
}
