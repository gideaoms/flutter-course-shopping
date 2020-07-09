class AuthenticateUserModel {
  String email;
  String password;

  AuthenticateUserModel({
    this.email,
    this.password,
  });

  AuthenticateUserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
