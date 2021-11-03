abstract class ApiEmployeeService {
  Future<void> fetchAllEmployee({int? limit});

  Future<void> fetchEmployeeById({required String id});
}
