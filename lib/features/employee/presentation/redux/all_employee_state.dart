import 'package:supy_io_test/common/networks/api_result/api_result.dart';
import 'package:supy_io_test/features/employee/infrastructure/models/employee_model.dart';

class AllEmployeeState {
  ApiResult<List<EmployeeModel>> apiResult;

  // List<EmployeeModel>? data;

  factory AllEmployeeState.initial() =>
      AllEmployeeState(const ApiResult.empty());

  factory AllEmployeeState.loading() =>
      AllEmployeeState(const ApiResult.loading());

  factory AllEmployeeState.data(List<EmployeeModel> data) =>
      AllEmployeeState(ApiResult.success(data: data));

  factory AllEmployeeState.failure(dynamic e) =>
      AllEmployeeState(ApiResult.failure(error: e));

  AllEmployeeState(this.apiResult);

  AllEmployeeState copyWith({
    ApiResult<List<EmployeeModel>>? apiResult,
  }) {
    return AllEmployeeState(
      apiResult ?? this.apiResult,
    );
  }
}
