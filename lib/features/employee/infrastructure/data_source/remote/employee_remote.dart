import 'package:either_dart/either.dart';
import 'package:supy_io_test/common/exceptions/network_exceptions/network_exceptions.dart';
import 'package:supy_io_test/common/networks/dio_client.dart';
import 'package:supy_io_test/features/employee/api/api_employee_route.dart';
import 'package:supy_io_test/features/employee/api/api_employee_service.dart';
import 'package:supy_io_test/features/employee/infrastructure/models/employee_model.dart';

class EmployeeRemote extends ApiEmployeeService {
  final DioClient dioClient;

  EmployeeRemote({required this.dioClient});

  @override
  Future<Either<NetworkExceptions, List<EmployeeModel>>>
      fetchAllEmployee() async {
    try {
      final response = await dioClient.get(kEmployeeRoute);
      List<EmployeeModel> employeeList = List<EmployeeModel>.from(
        (response).map(
          (data) => EmployeeModel.fromJson(data),
        ),
      );
      return Right(employeeList);
    } catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, EmployeeModel>> fetchEmployeeById(
      {required int id}) async {
    try {
      final response = await dioClient.get(kEmployeeRoute + '/$id');
      return Right(EmployeeModel.fromJson(response));
    } catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }
}
