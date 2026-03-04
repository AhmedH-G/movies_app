class UserDataModel {
  String? uId;
  String name;
  String email;
  String phone;
  String avatarUrl;

  UserDataModel({
    this.uId,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatarUrl,
  });

  factory UserDataModel.fromFireStore(Map<String, dynamic> json) {
    return UserDataModel(
      uId: json['uId'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      avatarUrl: json['avatarUrl'],
    );
  }
  Map<String, dynamic> toFireStore() {
    return {
      'uId': uId,
      'name': name,
      'email': email,
      'phone': phone,
      'avatarUrl': avatarUrl,
    };
  }
}
