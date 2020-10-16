// To parse this JSON data, do
//
//     final usersModels = usersModelsFromJson(jsonString);

import 'dart:convert';

UsersModels usersModelsFromJson(String str) => UsersModels.fromJson(json.decode(str));

String usersModelsToJson(UsersModels data) => json.encode(data.toJson());

class UsersModels {
    UsersModels({
        this.cellphone,
        this.role,
        this.parallels,
        this.id,
        this.name,
        this.lastName,
        this.born,
        this.identification,
        this.userName,
        this.email,
        this.password,
        this.v,
    });

    String cellphone;
    String role;
    List<dynamic> parallels;
    String id;
    String name;
    String lastName;
    DateTime born;
    String identification;
    String userName;
    String email;
    String password;
    int v;

    factory UsersModels.fromJson(Map<String, dynamic> json) => UsersModels(
        cellphone: json["cellphone"],
        role: json["role"],
        parallels: List<dynamic>.from(json["parallels"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        lastName: json["last_name"],
        born: DateTime.parse(json["born"]),
        identification: json["identification"],
        userName: json["user_name"],
        email: json["email"],
        password: json["password"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "cellphone": cellphone,
        "role": role,
        "parallels": List<dynamic>.from(parallels.map((x) => x)),
        "_id": id,
        "name": name,
        "last_name": lastName,
        "born": born.toIso8601String(),
        "identification": identification,
        "user_name": userName,
        "email": email,
        "password": password,
        "__v": v,
    };
}
