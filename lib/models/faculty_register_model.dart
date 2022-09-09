class FacultyRegisterModel {
  String? email;
  String? name;

  String? department;
  String? password;
  String? password2;

  FacultyRegisterModel(
      {this.email, this.name, this.department, this.password, this.password2});

  FacultyRegisterModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    department = json['department'];
    password = json['password'];
    password2 = json['password2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['department'] = this.department;
    data['password'] = this.password;
    data['password2'] = this.password2;

    return data;
  }

  factory FacultyRegisterModel.fromMap(Map<String, dynamic> map) {
    return FacultyRegisterModel(
      email: map['email']?.toString() ?? '',
      name: map['name']?.toString() ?? '',
      department: map['department']?.toString() ?? '',
      password: map['password']?.toString() ?? '',
      password2: map['password2']?.toString() ?? '',
    );
  }
}
