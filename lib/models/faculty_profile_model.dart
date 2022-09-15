class FacultyProfileModel {
  String? email;
  String? name;
  String? department;

  FacultyProfileModel({this.email, this.department, this.name});

  FacultyProfileModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];

    department = json['department'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;

    data['department'] = this.department;
    data['name'] = this.name;

    return data;
  }

  factory FacultyProfileModel.fromMap(Map<String, dynamic> map) {
    return FacultyProfileModel(
      email: map['email']?.toString() ?? '',
      name: map['name']?.toString() ?? '',
      department: map['name']?.toString() ?? '',
    );
  }
}
