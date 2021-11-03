import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:supy_io_test/_injections.dart' as injection;

import '_application.dart';
import '_injections.dart';
import 'common/config/app/app_config.dart';
import 'features/employee/presentation/redux/employee_state.dart';
import 'libraries/init_app/run_app.dart';

void main() async {
  /// inti for injection all your objects as singleton or factory or else .....
  await injection.init();

  runApplication(
      appConfig: kAppConfig,
      builder: () => StoreProvider(
            store: serviceLocator<Store<EmployeeState>>(),
            child: const Application(),
          ));
}
