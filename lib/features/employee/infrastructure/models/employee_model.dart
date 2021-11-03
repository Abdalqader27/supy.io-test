import '../../domain/entities/employee_entity.dart';

/// use this website for converting [https://app.quicktype.io/]

class EmployeeModel implements EmployeeEntity {
  EmployeeModel({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.description,
    required this.id,
  });

  @override
  final String createdAt;
  @override
  final String name;
  @override
  final String avatar;
  @override
  final String description;
  @override
  final String id;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        createdAt: json["createdAt"],
        name: json["name"],
        avatar: json["avatar"],
        description: json["description"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "name": name,
        "avatar": avatar,
        "description": description,
        "id": id,
      };
}
