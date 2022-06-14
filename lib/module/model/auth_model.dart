class AuthModel {
  AuthModel({
    this.jwt,
    this.user,
  });

  AuthModel.fromJson(dynamic json) {
    jwt = json['jwt'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? jwt;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['jwt'] = jwt;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}

class User {
  User({
    this.id,
    this.username,
    this.email,
    this.provider,
    this.confirmed,
    this.blocked,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.avatar,
    this.orders,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    provider = json['provider'];
    confirmed = json['confirmed'];
    blocked = json['blocked'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    avatar = json['avatar'];
    // if (json['orders'] != null) {
    //   orders = [];
    //   json['orders'].forEach((v) {
    //     orders?.add(dynamic.fromJson(v));
    //   });
    // }
  }
  int? id;
  String? username;
  String? email;
  String? provider;
  bool? confirmed;
  dynamic blocked;
  Role? role;
  String? createdAt;
  String? updatedAt;
  dynamic avatar;
  List<dynamic>? orders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['email'] = email;
    map['provider'] = provider;
    map['confirmed'] = confirmed;
    map['blocked'] = blocked;
    if (role != null) {
      map['role'] = role?.toJson();
    }
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['avatar'] = avatar;
    if (orders != null) {
      map['orders'] = orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Role {
  Role({
    this.id,
    this.name,
    this.description,
    this.type,
  });

  Role.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
  }
  int? id;
  String? name;
  String? description;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['type'] = type;
    return map;
  }
}
