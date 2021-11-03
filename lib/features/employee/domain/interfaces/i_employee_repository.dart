import 'package:supy_io_test/common/networks/api_result/api_result.dart';
import 'package:supy_io_test/features/employee/infrastructure/models/employee_model.dart';

abstract class IEmployeeRepository {
  Future<ApiResult<List<EmployeeModel>>> fetchAllEmployee({int? limit});

  Future<ApiResult<EmployeeModel>> fetchEmployeeById({required String id});
}
