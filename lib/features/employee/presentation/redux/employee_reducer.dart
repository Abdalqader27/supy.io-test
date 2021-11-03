import 'package:supy_io_test/features/employee/presentation/redux/employee_state.dart';

import 'employee_actions.dart';

EmployeeState employeeReducer(EmployeeState preState, dynamic action) {
  EmployeeState state = preState;
  if (action is GetEmployeesAction) {
    return SuccessState(employeeList: action.listEmployeeModel, employee: null);
  } else if (action is GetEmployeeByIdAction) {
    return SuccessState(employeeList: null, employee: action.employeeModel);
  } else if (action is LoadingAction) {
    return LoadingState();
  } else if (action is FailureAction) {
    return FailureState(action.message);
  }

  return state;
}
// I want to use combineReducers but this is a simple app
