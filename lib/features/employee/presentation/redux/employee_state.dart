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

//Todo
class SuccessState extends EmployeeState {
  final List<EmployeeModel>? employeeList;
  final EmployeeModel? employee;

  SuccessState({this.employeeList, this.employee});

  factory SuccessState.init() {
    return SuccessState(employeeList: [], employee: null);
  }

  SuccessState copyWith({
    List<EmployeeModel>? employeeList,
    EmployeeModel? employee,
  }) =>
      SuccessState(
        employee: employee ?? this.employee,
        employeeList: employeeList ?? this.employeeList,
      );
}
