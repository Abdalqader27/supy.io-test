abstract class EmployeeEntity {
  EmployeeEntity({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.description,
    required this.id,
  });

  String createdAt;
  String name;
  String avatar;
  String description;
  String id;
}
