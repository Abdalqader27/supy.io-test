abstract class EmployeeEntity {
  EmployeeEntity({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.description,
    required this.id,
  });

  final String createdAt;
  final String name;
  final String avatar;
  final String description;
  final String id;
}
