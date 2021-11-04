import 'package:get_it/get_it.dart';
import 'package:supy_io_test/features/employee/injections/employee_injection.dart';

import 'features/employee/injections/network_injection.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //Every thing at network we have init here
  await networkInjectionInit();
// my features injections ---------------------
  EmployeeInjection.init();
}
