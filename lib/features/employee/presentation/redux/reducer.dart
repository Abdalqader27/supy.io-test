import 'package:supy_io_test/common/networks/api_result/api_result.dart';
import 'package:supy_io_test/features/employee/presentation/redux/app_state.dart';

import 'actions.dart';

AppState reducer(AppState preState, dynamic action) {
  AppState state = preState;
  if (action is GetAllEmployeeAction) {
    return AppState(
        employeeList: ApiResult.success(data: action.listEmployeeModel));
  } else if (action is GetEmployeeAction) {
    return AppState(
        currentEmployee: ApiResult.success(data: action.employeeModel));
  }
  return state;
}
