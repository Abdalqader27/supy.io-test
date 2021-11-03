import 'package:supy_io_test/features/employee/infrastructure/models/employee_model.dart';

class LoadingAction {}

class EmptyAction {}

class ErrorAction {}

class GetEmployeesAction {
  final List<EmployeeModel> listEmployeeModel;

  GetEmployeesAction(this.listEmployeeModel);
}

class GetEmployeeByIdAction {
  final EmployeeModel employeeModel;

  GetEmployeeByIdAction(this.employeeModel);
}
