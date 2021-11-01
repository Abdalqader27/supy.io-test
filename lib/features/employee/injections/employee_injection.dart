import 'package:redux/redux.dart';
import 'package:supy_io_test/common/networks/dio_client.dart';
import 'package:supy_io_test/common/platform/connectivity.dart';
import 'package:supy_io_test/features/employee/infrastructure/data_source/remote/employee_remote.dart';
import 'package:supy_io_test/features/employee/infrastructure/repositories/employee_repository.dart';
import 'package:supy_io_test/features/employee/presentation/pages/all_employee/all_employee_page.dart';

import '../../../_injections.dart';

class EmployeeInjection {
  static init() {
    serviceLocator
        .registerFactory(() => Store<int>(counterReducer, initialState: 0));

    serviceLocator.registerLazySingleton(() => EmployeeRemote(
          dioClient: serviceLocator<DioClient>(),
        ));

    serviceLocator.registerLazySingleton(() => EmployeeRepository(
          connectivity: serviceLocator<Connectivity>(),
          employeeRemote: serviceLocator<EmployeeRemote>(),
        ));
  }
}
