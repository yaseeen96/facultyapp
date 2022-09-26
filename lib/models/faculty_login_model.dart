class FacultyLoginModel {
  String? email;
  String? token;
  String? errorMessage;

  FacultyLoginModel({
    this.email,
    this.token,
  });

  FacultyLoginModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['token'] = this.token;
    return data;
  }

  factory FacultyLoginModel.fromMap(Map<String, dynamic> map) {
    return FacultyLoginModel(
      email: map['email']?.toString() ?? '',
      token: map['token']?.toString() ?? '',
    );
  }
}
