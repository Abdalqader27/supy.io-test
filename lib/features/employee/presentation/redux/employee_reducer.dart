import 'package:redux/redux.dart';
import 'package:supy_io_test/features/employee/presentation/redux/employee_state.dart';

import 'employee_actions.dart';

EmployeeState employeeReducer(EmployeeState preState, dynamic action) {
  // EmployeeState state = preState;
  // if (action is GetEmployeesAction) {
  //   return SuccessState(employeeList: action.listEmployeeModel, employee: null);
  // } else if (action is GetEmployeeByIdAction) {
  //   return SuccessState(employeeList: null, employee: action.employeeModel);
  // } else if (action is LoadingAction) {
  //   return LoadingState();
  // } else if (action is FailureAction) {
  //   return FailureState(action.message);
  // }
  //
  // return state;
  return itemsReducer(preState, action);
}

EmployeeState getEmployeesReducer(
    EmployeeState preState, GetEmployeesAction action) {
  return SuccessState(employeeList: action.listEmployeeModel);
}

EmployeeState getEmployeeByIdReducer(
    EmployeeState preState, GetEmployeeByIdAction action) {
  return SuccessState(employee: action.employeeModel);
}

EmployeeState getLoadingReducer(EmployeeState preState, LoadingAction action) {
  return LoadingState();
}

EmployeeState getFailureReducer(EmployeeState preState, FailureAction action) {
  return FailureState(action.message);
}

Reducer<EmployeeState> itemsReducer = combineReducers<EmployeeState>([
  // Each `TypedReducer` will glue Actions of a certain type to the given
  // reducer! This means you don't need to write a bunch of `if` checks
  // manually, and can quickly scan the list of `TypedReducer`s to see what
  // reducer handles what action.
  TypedReducer<EmployeeState, GetEmployeesAction>(getEmployeesReducer),
  TypedReducer<EmployeeState, GetEmployeeByIdAction>(getEmployeeByIdReducer),
  TypedReducer<EmployeeState, LoadingAction>(getLoadingReducer),
  TypedReducer<EmployeeState, FailureAction>(getFailureReducer),
]);
