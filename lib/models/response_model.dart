class ResponseModel {
  int? id;
  String? studentName;
  String? department;
  String? usn;
  String? semester;
  String? studentEmail;
  Event? event;

  ResponseModel(
      {this.id,
      this.studentName,
      this.department,
      this.usn,
      this.semester,
      this.studentEmail,
      this.event});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentName = json['studentName'];
    department = json['department'];
    usn = json['usn'];
    semester = json['semester'];
    studentEmail = json['studentEmail'];
    event = json['event'] != null ? new Event.fromJson(json['event']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['studentName'] = this.studentName;
    data['department'] = this.department;
    data['usn'] = this.usn;
    data['semester'] = this.semester;
    data['studentEmail'] = this.studentEmail;
    if (this.event != null) {
      data['event'] = this.event!.toJson();
    }
    return data;
  }
}

class Event {
  int? id;
  String? eventTitle;
  String? eventType;
  String? resourceName;
  String? aboutResource;
  String? aboutEvent;
  String? venue;
  String? social;
  String? startDate;
  String? endDate;
  String? image;

  Event(
      {this.id,
      this.eventTitle,
      this.eventType,
      this.resourceName,
      this.aboutResource,
      this.aboutEvent,
      this.venue,
      this.social,
      this.startDate,
      this.endDate,
      this.image});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventTitle = json['eventTitle'];
    eventType = json['eventType'];
    resourceName = json['resourceName'];
    aboutResource = json['aboutResource'];
    aboutEvent = json['aboutEvent'];
    venue = json['venue'];
    social = json['social'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['eventTitle'] = this.eventTitle;
    data['eventType'] = this.eventType;
    data['resourceName'] = this.resourceName;
    data['aboutResource'] = this.aboutResource;
    data['aboutEvent'] = this.aboutEvent;
    data['venue'] = this.venue;
    data['social'] = this.social;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['image'] = this.image;
    return data;
  }
}
