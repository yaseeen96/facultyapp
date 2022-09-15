class AddEventModel {
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

  AddEventModel(
      {this.eventTitle,
      this.eventType,
      this.resourceName,
      this.aboutResource,
      this.aboutEvent,
      this.venue,
      this.social,
      this.startDate,
      this.endDate,
      this.image});

  AddEventModel.fromJson(Map<String, dynamic> json) {
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
