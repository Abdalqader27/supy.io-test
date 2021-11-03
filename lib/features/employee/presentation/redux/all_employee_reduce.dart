import 'package:supy_io_test/_injections.dart';
import 'package:supy_io_test/common/networks/api_result/api_result.dart';
import 'package:supy_io_test/features/employee/infrastructure/repositories/employee_repository.dart';
import 'package:supy_io_test/features/employee/presentation/redux/all_employee_state.dart';
import 'package:supy_io_test/features/employee/presentation/redux/employee_actions.dart';

AllEmployeeState allEmployeeReducer(AllEmployeeState preState, dynamic action) {
  AllEmployeeState newState = preState;
  if (action is GetAllEmployee) {
    serviceLocator<EmployeeRepository>().fetchAllEmployee().then((result) {
      result.map(success: (success) {
        newState = AllEmployeeState(ApiResult.success(data: success.data));
        //  return AllEmployeeState(ApiResult.success(data: success.data));
      }, failure: (failure) {
        newState = AllEmployeeState(ApiResult.failure(error: failure.error));

        // return AllEmployeeState(ApiResult.failure(error: failure.error));
      }, empty: (_) {
        newState.copyWith(apiResult: const ApiResult.empty());

        //  return AllEmployeeState(const ApiResult.empty());
      }, loading: (_) {
        newState.copyWith(apiResult: const ApiResult.loading());

        //    return AllEmployeeState(const ApiResult.loading());
      });
    });
  }
  return newState;
}
