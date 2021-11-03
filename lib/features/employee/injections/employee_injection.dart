import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:supy_io_test/common/networks/api_result/api_result.dart';
import 'package:supy_io_test/common/networks/dio_client.dart';
import 'package:supy_io_test/common/platform/connectivity.dart';
import 'package:supy_io_test/features/employee/infrastructure/data_source/remote/employee_remote.dart';
import 'package:supy_io_test/features/employee/infrastructure/repositories/employee_repository.dart';
import 'package:supy_io_test/features/employee/presentation/redux/newredux/app_state.dart';
import 'package:supy_io_test/features/employee/presentation/redux/newredux/reducer.dart';

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
    serviceLocator.registerLazySingleton(() => Store<AppState>(reducer,
        initialState: AppState(
            employeeList: const ApiResult.loading(),
            currentEmployee: const ApiResult.loading()),
        middleware: [thunkMiddleware]));
  }
}
