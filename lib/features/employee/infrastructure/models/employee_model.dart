import 'dart:convert';

import '../../domain/entities/employee_entity.dart';

/// TODO => use this website for converting [https://app.quicktype.io/]
List<EmployeeModel> employeeModelFromJson(String str) =>
    List<EmployeeModel>.from(
        json.decode(str).map((x) => EmployeeModel.fromJson(x)));

String employeeModelToJson(List<EmployeeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeModel extends EmployeeEntity {
  EmployeeModel({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.description,
    required this.id,
  }) : super(
            id: id,
            avatar: avatar,
            createdAt: createdAt,
            description: description,
            name: name);

  String createdAt;
  String name;
  String avatar;
  String description;
  String id;

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
