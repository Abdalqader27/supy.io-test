import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:supy_io_test/_injections.dart';
import 'package:supy_io_test/common/networks/dio_client.dart';
import 'package:supy_io_test/common/services/connectivity.dart';

Future<void> networkInjection() async {
  serviceLocator.registerLazySingleton(
    () => Dio(),
  );
  serviceLocator.registerLazySingleton(() {
    return DioClient(dio: serviceLocator<Dio>(), interceptors: []);
  });
  serviceLocator.registerLazySingleton(() => InternetConnectionChecker());

  serviceLocator.registerLazySingleton(() => Connectivity(
      internetChecker: serviceLocator<InternetConnectionChecker>()));
}
