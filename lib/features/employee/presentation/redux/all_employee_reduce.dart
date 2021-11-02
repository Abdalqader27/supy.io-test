import 'package:supy_io_test/_injections.dart';
import 'package:supy_io_test/common/networks/api_result/api_result.dart';
import 'package:supy_io_test/features/employee/infrastructure/models/employee/all_employee_state.dart';
import 'package:supy_io_test/features/employee/infrastructure/models/employee_model.dart';
import 'package:supy_io_test/features/employee/infrastructure/repositories/employee_repository.dart';
import 'package:supy_io_test/features/employee/presentation/redux/employee_actions.dart';

Future<AllEmployeeState> allEmployeeReducer(
    AllEmployeeState state, dynamic action) async {
  AllEmployeeState newState = state;
  newState.loading = true;
  if (action is GetAllEmployee) {
    ApiResult<List<EmployeeModel>> result =
        await serviceLocator<EmployeeRepository>().fetchAllEmployee();
    result.map(
        success: (data) => {
              newState.loading = false,
              newState.data = data as List<EmployeeModel>?,
            },
        failure: (failure) => {
              newState.loading = false,
              newState.error = failure,
            },
        empty: (e) => {
              newState.loading = false,
              newState.data = [],
            });
  } else if (action is GetEmployee) {}
  return newState;
}
