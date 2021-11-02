import 'package:supy_io_test/features/employee/infrastructure/models/employee_model.dart';

class AllEmployeeState {
  dynamic error;
  bool? loading;
  List<EmployeeModel>? data;

  AllEmployeeState({
    this.error,
    this.loading,
    this.data,
  });

  factory AllEmployeeState.initial() => AllEmployeeState(
        error: null,
        loading: false,
        data: [],
      );
}
