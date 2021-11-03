import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:supy_io_test/common/networks/dio_client.dart';
import 'package:supy_io_test/common/services/connectivity.dart';
import 'package:supy_io_test/features/employee/infrastructure/data_source/remote/employee_remote.dart';
import 'package:supy_io_test/features/employee/infrastructure/repositories/employee_repository.dart';
import 'package:supy_io_test/features/employee/presentation/redux/employee_reducer.dart';
import 'package:supy_io_test/features/employee/presentation/redux/employee_state.dart';

import '../../../_injections.dart';

class EmployeeInjection {
  static init() {
    serviceLocator.registerLazySingleton(() => EmployeeRemote(
          dioClient: serviceLocator<DioClient>(),
        ));

    serviceLocator.registerLazySingleton(() => EmployeeRepository(
          connectivity: serviceLocator<Connectivity>(),
          employeeRemote: serviceLocator<EmployeeRemote>(),
        ));

    serviceLocator.registerFactory(
      () => Store<EmployeeState>(employeeReducer,
          distinct: true,
          initialState: LoadingState(),
          middleware: [thunkMiddleware]),
    );
  }
}
