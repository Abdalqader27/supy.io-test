import 'package:supy_io_test/common/platform/connectivity.dart';
import 'package:supy_io_test/features/employee/domain/interfaces/i_employee_repository.dart';
import 'package:supy_io_test/features/employee/infrastructure/data_source/remote/employee_remote.dart';

class EmployeeRepository extends IEmployeeRepository {
  @override
  final Connectivity connectivity;
  @override
  final EmployeeRemote employeeRemote;

  EmployeeRepository({
    required this.connectivity,
    required this.employeeRemote,
  }) : super(
          connectivity: connectivity,
          employeeRemote: employeeRemote,
        );
}
