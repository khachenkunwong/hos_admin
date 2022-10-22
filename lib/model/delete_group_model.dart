// To parse this JSON data, do
//
//     final notificationDeleteGroup = notificationDeleteGroupFromJson(jsonString);

import 'dart:convert';

NotificationDeleteGroup notificationDeleteGroupFromJson(String str) => NotificationDeleteGroup.fromJson(json.decode(str));

String notificationDeleteGroupToJson(NotificationDeleteGroup data) => json.encode(data.toJson());

class NotificationDeleteGroup {
    NotificationDeleteGroup({
        this.notifications,
    });

    List<Notification>? notifications;

    factory NotificationDeleteGroup.fromJson(Map<String, dynamic> json) => NotificationDeleteGroup(
        notifications: json["notifications"] == null ? null : List<Notification>.from(json["notifications"].map((x) => Notification.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "notifications": notifications == null ? null : List<dynamic>.from(notifications!.map((x) => x.toJson())),
    };
}

class Notification {
    Notification({
        this.id,
        this.type,
        this.fields,
        this.approveBy,
        this.noift,
    });

    String? id;
    String? type;
    Fields? fields;
    ApproveBy? approveBy;
    String? noift;

    factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["_id"] == null ? null : json["_id"],
        type: json["type"] == null ? null : json["type"],
        fields: json["fields"] == null ? null : Fields.fromJson(json["fields"]),
        approveBy: json["approve_by"] == null ? null : ApproveBy.fromJson(json["approve_by"]),
        noift: json["noift"] == null ? null : json["noift"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "type": type == null ? null : type,
        "fields": fields == null ? null : fields!.toJson(),
        "approve_by": approveBy == null ? null : approveBy!.toJson(),
        "noift": noift == null ? null : noift,
    };
}

class ApproveBy {
    ApproveBy({
        this.fristName,
        this.lastName,
        this.actor,
    });

    String? fristName;
    String? lastName;
    String? actor;

    factory ApproveBy.fromJson(Map<String, dynamic> json) => ApproveBy(
        fristName: json["frist_name"] == null ? null : json["frist_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        actor: json["actor"] == null ? null : json["actor"],
    );

    Map<String, dynamic> toJson() => {
        "frist_name": fristName == null ? null : fristName,
        "last_name": lastName == null ? null : lastName,
        "actor": actor == null ? null : actor,
    };
}

class Fields {
    Fields({
        this.group,
    });

    Group? group;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        group: json["group"] == null ? null : Group.fromJson(json["group"]),
    );

    Map<String, dynamic> toJson() => {
        "group": group == null ? null : group!.toJson(),
    };
}

class Group {
    Group({
        this.id,
        this.location,
        this.nameGroup,
        this.limit,
        this.leader,
        this.member,
        this.deleted,
        this.v,
    });

    String? id;
    String? location;
    String? nameGroup;
    int? limit;
    List<String>? leader;
    List<String>? member;
    bool? deleted;
    int? v;

    factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["_id"] == null ? null : json["_id"],
        location: json["location"] == null ? null : json["location"],
        nameGroup: json["name_group"] == null ? null : json["name_group"],
        limit: json["limit"] == null ? null : json["limit"],
        leader: json["_leader"] == null ? null : List<String>.from(json["_leader"].map((x) => x)),
        member: json["_member"] == null ? null : List<String>.from(json["_member"].map((x) => x)),
        deleted: json["deleted"] == null ? null : json["deleted"],
        v: json["__v"] == null ? null : json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "location": location == null ? null : location,
        "name_group": nameGroup == null ? null : nameGroup,
        "limit": limit == null ? null : limit,
        "_leader": leader == null ? null : List<dynamic>.from(leader!.map((x) => x)),
        "_member": member == null ? null : List<dynamic>.from(member!.map((x) => x)),
        "deleted": deleted == null ? null : deleted,
        "__v": v == null ? null : v,
    };
}
