import 'package:supy_io_test/common/networks/api_result/api_result.dart';
import 'package:supy_io_test/features/employee/presentation/redux/employee_state.dart';

import 'employee_actions.dart';

EmployeeState employeeReducer(EmployeeState preState, dynamic action) {
  EmployeeState state = preState;
  if (action is GetEmployeesAction) {
    return EmployeeState(
        employeeList: ApiResult.success(data: action.listEmployeeModel),
        employee: state.employee);
  } else if (action is GetEmployeeByIdAction) {
    return EmployeeState(
      employeeList: state.employeeList,
      employee: ApiResult.success(data: action.employeeModel),
    );
  }
  return state;
}
