import 'package:supy_io_test/common/networks/api_result/api_result.dart';
import 'package:supy_io_test/features/employee/infrastructure/models/employee_model.dart';

class EmployeeState {
  ApiResult<List<EmployeeModel>>? employeeList;
  ApiResult<EmployeeModel>? employee;

  EmployeeState({
    this.employeeList,
    this.employee,
  });

  factory EmployeeState.initial({employeeList = const [], currentEmployee}) =>
      EmployeeState(
        employeeList: employeeList,
        employee: currentEmployee,
      );
}
