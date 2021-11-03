import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:supy_io_test/_injections.dart';
import 'package:supy_io_test/common/exceptions/network_exceptions/network_exceptions.dart';
import 'package:supy_io_test/common/networks/api_result/api_result.dart';
import 'package:supy_io_test/features/employee/infrastructure/models/employee_model.dart';
import 'package:supy_io_test/features/employee/infrastructure/repositories/employee_repository.dart';
import 'package:supy_io_test/features/employee/presentation/redux/employee_actions.dart';

import 'employee_state.dart';

ThunkAction<EmployeeState> getEmployeesThunks() {
  return (Store<EmployeeState> store) async {
    store.dispatch(LoadingAction());

    ApiResult<List<EmployeeModel>> list =
        await serviceLocator<EmployeeRepository>().fetchAllEmployee();
    return list.when(
      success: (data) => store.dispatch(GetEmployeesAction(data)),
      failure: (e) =>
          store.dispatch(FailureAction(NetworkExceptions.getErrorMessage(e))),
      empty: () => store.dispatch(EmptyAction()),
      loading: () => store.dispatch(LoadingAction()),
    );
  };
}

ThunkAction<EmployeeState> getEmployeeByIdThunks(String id) {
  return (Store<EmployeeState> store) async {
    store.dispatch(LoadingAction());

    ApiResult<EmployeeModel> employee =
        await serviceLocator<EmployeeRepository>().fetchEmployeeById(id: id);
    employee.when(
      success: (data) => store.dispatch(GetEmployeeByIdAction(data)),
      failure: (e) =>
          store.dispatch(FailureAction(NetworkExceptions.getErrorMessage(e))),
      empty: () => store.dispatch(EmptyAction()),
      loading: () => store.dispatch(LoadingAction()),
    );
  };
}
