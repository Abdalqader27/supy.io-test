abstract class ApiEmployeeService {
  Future<void> fetchAllEmployee();

  Future<void> fetchEmployeeById({required String id});
}
