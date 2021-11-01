import 'package:supy_io_test/common/platform/connectivity.dart';
import 'package:supy_io_test/features/employee/infrastructure/data_source/remote/employee_remote.dart';

abstract class IEmployeeRepository {
  final Connectivity connectivity;
  final EmployeeRemote employeeRemote;

  IEmployeeRepository({
    required this.connectivity,
    required this.employeeRemote,
  });
}
