import 'package:supy_io_test/features/employee/infrastructure/models/employee_model.dart';

class LoadingAction {}

class GetAllEmployeeAction {
  final List<EmployeeModel> listEmployeeModel;

  GetAllEmployeeAction(this.listEmployeeModel);
}

class EmptyAction {}

class ErrorAction {}

class GetEmployeeAction {
  final EmployeeModel employeeModel;

  GetEmployeeAction(this.employeeModel);
}
