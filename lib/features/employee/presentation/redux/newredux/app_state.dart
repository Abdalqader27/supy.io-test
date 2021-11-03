import 'package:supy_io_test/common/networks/api_result/api_result.dart';
import 'package:supy_io_test/features/employee/infrastructure/models/employee_model.dart';

class AppState {
  ApiResult<List<EmployeeModel>?>? employeeList;
  ApiResult<EmployeeModel>? currentEmployee;

  AppState({
    this.employeeList,
    this.currentEmployee,
  });

  factory AppState.initial({employeeList = const [], currentEmployee}) =>
      AppState(
        employeeList: employeeList,
        currentEmployee: currentEmployee,
      );

  AppState copyWith({
    ApiResult<List<EmployeeModel>?>? employeeList,
    ApiResult<EmployeeModel>? currentEmployee,
  }) {
    return AppState(
      employeeList: employeeList ?? this.employeeList,
      currentEmployee: currentEmployee ?? this.currentEmployee,
    );
  }
}
