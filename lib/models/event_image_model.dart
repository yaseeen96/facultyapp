import './events_model.dart';

class EventsImageModel {
  int? id;
  String? eventImage;
  EventsModel? event;

  EventsImageModel({this.id, this.eventImage, this.event});

  EventsImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventImage = json['eventImage'];
    event =
        json['event'] != null ? new EventsModel.fromJson(json['event']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['eventImage'] = this.eventImage;
    if (this.event != null) {
      data['event'] = this.event!.toJson();
    }
    return data;
  }
}
