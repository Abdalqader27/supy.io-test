import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:supy_io_test/_injections.dart';
import 'package:supy_io_test/common/networks/api_result/api_result.dart';
import 'package:supy_io_test/features/employee/infrastructure/models/employee_model.dart';
import 'package:supy_io_test/features/employee/infrastructure/repositories/employee_repository.dart';
import 'package:supy_io_test/features/employee/presentation/redux/newredux/actions.dart';

import 'app_state.dart';

ThunkAction<AppState> getEmployeesThunks() {
  return (Store<AppState> store) async {
    ApiResult<List<EmployeeModel>> list =
        await serviceLocator<EmployeeRepository>().fetchAllEmployee();
    store.dispatch(LoadingAction());
    list.when(success: (data) {
      store.dispatch(GetAllEmployeeAction(data));
    }, failure: (e) {
      store.dispatch(LoadingAction());
    }, empty: () {
      store.dispatch(EmptyAction());
    }, loading: () {
      store.dispatch(LoadingAction());
    });
  };
}
