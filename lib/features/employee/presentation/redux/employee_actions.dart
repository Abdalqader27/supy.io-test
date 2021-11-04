import 'package:supy_io_test/features/employee/infrastructure/models/employee_model.dart';

class LoadingAction {}

class EmptyAction {}

class FailureAction {
  final String message;

  FailureAction(this.message);
}
class LoadItemsPageAction {
  LoadItemsPageAction({
    required this.pageNumber,
    required this.itemsPerPage,
  });

  final int pageNumber;
  final int itemsPerPage;
}

class GetEmployeesAction {
  final List<EmployeeModel> listEmployeeModel;

  GetEmployeesAction(this.listEmployeeModel);
}

class GetEmployeeByIdAction {
  final EmployeeModel employeeModel;

  GetEmployeeByIdAction(this.employeeModel);
}

