// To parse this JSON data, do
//
//     final cursesModels = cursesModelsFromJson(jsonString);

import 'dart:convert';

CursesModels cursesModelsFromJson(String str) => CursesModels.fromJson(json.decode(str));

String cursesModelsToJson(CursesModels data) => json.encode(data.toJson());

class CursesModels {
    CursesModels({
        this.parallels,
        this.id,
        this.name,
        this.v,
    });

    List<Parallel> parallels;
    String id;
    String name;
    int v;

    factory CursesModels.fromJson(Map<String, dynamic> json) => CursesModels(
        parallels: List<Parallel>.from(json["parallels"].map((x) => Parallel.fromJson(x))),
        id: json["_id"],
        name: json["name"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "parallels": List<dynamic>.from(parallels.map((x) => x.toJson())),
        "_id": id,
        "name": name,
        "__v": v,
    };
}

class Parallel {
    Parallel({
        this.parallelId,
        this.letter,
    });

    String parallelId;
    String letter;

    factory Parallel.fromJson(Map<String, dynamic> json) => Parallel(
        parallelId: json["parallel_id"],
        letter: json["letter"],
    );

    Map<String, dynamic> toJson() => {
        "parallel_id": parallelId,
        "letter": letter,
    };
}
