import 'package:either_dart/either.dart';
import 'package:supy_io_test/common/exceptions/network_exceptions/network_exceptions.dart';
import 'package:supy_io_test/common/networks/api_result/api_result.dart';
import 'package:supy_io_test/common/platform/connectivity.dart';
import 'package:supy_io_test/features/employee/domain/interfaces/i_employee_repository.dart';
import 'package:supy_io_test/features/employee/infrastructure/data_source/remote/employee_remote.dart';
import 'package:supy_io_test/features/employee/infrastructure/models/employee_model.dart';

class EmployeeRepository extends IEmployeeRepository {
  final Connectivity connectivity;
  final EmployeeRemote employeeRemote;

  EmployeeRepository({
    required this.connectivity,
    required this.employeeRemote,
  }) : super();

  @override
  Future<ApiResult<List<EmployeeModel>>> fetchAllEmployee({int? limit}) async {
    if (await connectivity.isConnected) {
      final Either<NetworkExceptions, List<EmployeeModel>> employeeResult =
          await employeeRemote.fetchAllEmployee();

      if (employeeResult.isRight) {
        if (employeeResult.right.isEmpty) {
          return const ApiResult.empty();
        }
        return ApiResult.success(data: employeeResult.right);
      } else {
        return ApiResult.failure(error: employeeResult.left);
      }
    } else {
      const ApiResult.failure(error: NetworkExceptions.noInternetConnection());
    }
    return const ApiResult.loading();
  }

  @override
  Future<ApiResult<EmployeeModel>> fetchEmployeeById(
      {required String id}) async {
    if (await connectivity.isConnected) {
      final Either<NetworkExceptions, EmployeeModel> result =
          await employeeRemote.fetchEmployeeById(id: id);

      if (result.isRight) {
        return ApiResult.success(data: result.right);
      } else {
        return ApiResult.failure(error: result.left);
      }
    } else {
      const ApiResult.failure(error: NetworkExceptions.noInternetConnection());
    }
    return const ApiResult.empty();
  }
}
