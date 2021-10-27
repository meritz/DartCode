import 'dart:io';

class User {
  String displayName;
  String email;
  String password;
  String uuid;
  String role;
  double balance;
  String phone;
  String profilePic;
  File profileFile;

  User();

  User.fromMap(Map<String, dynamic> data) {
    displayName = data['displayName'];
    email = data['email'];
    password = data['password'];
    uuid = data['uuid'];
    role = data['role'];
    balance = data['balance'];
    phone = data['phone'];
    profilePic = data['profilePic'];
  }

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'email': email,
      'password': password,
      'uuid': uuid,
      'role': role,
      'balance': balance,
      'phone': phone,
      'profilePic': profilePic,
    };
  }
}
