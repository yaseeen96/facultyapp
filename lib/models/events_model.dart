class EventsModel {
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

  EventsModel(
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

  EventsModel.fromJson(Map<String, dynamic> json) {
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

  factory EventsModel.fromMap(Map<String, dynamic> map) {
    return EventsModel(
      id: map['id']?.toInt() ?? 0,
      eventTitle: map['eventTitle'] ?? '',
      eventType: map['eventType'] ?? '',
      resourceName: map['resourceName'] ?? '',
      aboutResource: map['aboutResource'] ?? '',
      aboutEvent: map['aboutEvent'] ?? '',
      venue: map['venue'] ?? '',
      social: map['social'] ?? '',
      startDate: map['startDate'] ?? '',
      endDate: map['endDate'] ?? '',
      image: map['image'] ?? '',
    );
  }
}
