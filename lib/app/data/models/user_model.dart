class UserModel {
  String? uid;
  String? name;
  String? username;
  String? phone;
  String? email;
  String? photo;
  String? role;

  UserModel(
      {this.uid,
      this.name,
      this.username,
      this.phone,
      this.email,
      this.photo,
      this.role});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    username = json['username'];
    phone = json['phone'];
    email = json['email'];
    photo = json['photo'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['username'] = username;
    data['phone'] = phone;
    data['email'] = email;
    data['photo'] = photo;
    data['role'] = role;
    return data;
  }
}
