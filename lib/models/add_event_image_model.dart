import 'events_model.dart';

class AddEventImageModel {
  String? eventImage;
  EventsModel? event;

  AddEventImageModel({this.eventImage, this.event});

  AddEventImageModel.fromJson(Map<String, dynamic> json) {
    eventImage = json['eventImage'];
    event =
        json['event'] != null ? new EventsModel.fromJson(json['event']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventImage'] = this.eventImage;
    if (this.event != null) {
      data['event'] = this.event!.toJson();
    }
    return data;
  }
}
