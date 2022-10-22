// To parse this JSON data, do
//
//     final showMemberAll = showMemberAllFromJson(jsonString);

import 'dart:convert';

ShowMemberAll showMemberAllFromJson(String str) => ShowMemberAll.fromJson(json.decode(str));

String showMemberAllToJson(ShowMemberAll data) => json.encode(data.toJson());

class ShowMemberAll {
    ShowMemberAll({
        this.users,
    });

    List<User>? users;

    factory ShowMemberAll.fromJson(Map<String, dynamic> json) => ShowMemberAll(
        users: json["users"] == null ? null : List<User>.from(json["users"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "users": users == null ? null : List<dynamic>.from(users!.map((x) => x.toJson())),
    };
}

class User {
    User({
        this.fristName,
        this.id,
        this.lastName,
        this.localtion,
        this.actor,
        this.email,
    });

    String? fristName;
    String? id;
    String? lastName;
    dynamic? localtion;
    String? actor;
    String? email;

    factory User.fromJson(Map<String, dynamic> json) => User(
        fristName: json["frist_name"] == null ? null : json["frist_name"],
        id: json["_id"] == null ? null : json["_id"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        localtion: json["localtion"],
        actor: json["actor"] == null ? null : json["actor"],
        email: json["email"] == null ? null : json["email"],
    );

    Map<String, dynamic> toJson() => {
        "frist_name": fristName == null ? null : fristName,
        "_id": id == null ? null : id,
        "last_name": lastName == null ? null : lastName,
        "localtion": localtion,
        "actor": actor == null ? null : actor,
        "email": email == null ? null : email,
    };
}
