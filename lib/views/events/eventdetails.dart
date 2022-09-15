import 'package:facultyapp/views/events/event_pictures.dart';
import 'package:facultyapp/views/events/event_responses.dart';
import 'package:facultyapp/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/events_model.dart';
import '../../models/faculty_profile_model.dart';
import '../../utils/configurations.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({super.key, required this.eventData});

  final EventsModel? eventData;

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  bool _aboutEventExpanded = false;
  bool _eventTypeExpanded = false;
  bool _aboutResourceExpanded = false;
  bool _venueExpanded = false;
  bool _timingsExpanded = false;

  @override
  void initState() {
    // _customTileExpanded = false;
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.eventData!.eventTitle}",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        elevation: 0,
        leading: IconButton(
            color: Theme.of(context).primaryColor,
            iconSize: getDeviceWidth(context) * 0.07,
            onPressed: () => Navigator.pop(context, true),
            icon: Icon(Icons.arrow_back_rounded)),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image(
                  width: getDeviceWidth(context),
                  height: getDeviceHeight(context) * 0.25,
                  image: NetworkImage('${widget.eventData!.image}')),
            ),
            SizedBox(
              height: getDeviceHeight(context) * 0.02,
            ),
            ExpansionTile(
              initiallyExpanded: true,
              backgroundColor: Theme.of(context).highlightColor,
              collapsedBackgroundColor: Theme.of(context).highlightColor,
              title: Text(
                "About Event",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Theme.of(context).canvasColor,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                _aboutEventExpanded
                    ? Icons.arrow_drop_down_circle
                    : Icons.arrow_drop_down,
                color: Theme.of(context).primaryColor,
                size: getDeviceWidth(context) * 0.1,
              ),
              children: [
                ListTile(
                  title: Text(
                    "${widget.eventData!.aboutEvent}",
                    style: TextStyle(
                        fontSize: 14.sp, color: Theme.of(context).canvasColor),
                  ),
                ),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() => _aboutEventExpanded = expanded);
              },
            ),
            SizedBox(
              height: getDeviceHeight(context) * 0.02,
            ),
            ExpansionTile(
              initiallyExpanded: true,
              backgroundColor: Theme.of(context).highlightColor,
              collapsedBackgroundColor: Theme.of(context).highlightColor,
              title: Text(
                "Type of event",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Theme.of(context).canvasColor,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                _eventTypeExpanded
                    ? Icons.arrow_drop_down_circle
                    : Icons.arrow_drop_down,
                color: Theme.of(context).primaryColor,
                size: getDeviceWidth(context) * 0.1,
              ),
              children: [
                ListTile(
                  title: Text(
                    "${widget.eventData!.eventType}",
                    style: TextStyle(
                        fontSize: 14.sp, color: Theme.of(context).canvasColor),
                  ),
                ),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() => _eventTypeExpanded = expanded);
              },
            ),
            SizedBox(
              height: getDeviceHeight(context) * 0.02,
            ),
            ExpansionTile(
              initiallyExpanded: true,
              backgroundColor: Theme.of(context).highlightColor,
              collapsedBackgroundColor: Theme.of(context).highlightColor,
              title: Text(
                "About Resource Person",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Theme.of(context).canvasColor,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                _aboutResourceExpanded
                    ? Icons.arrow_drop_down_circle
                    : Icons.arrow_drop_down,
                color: Theme.of(context).primaryColor,
                size: getDeviceWidth(context) * 0.1,
              ),
              children: [
                ListTile(
                  title: Text(
                    "${widget.eventData!.aboutResource}",
                    style: TextStyle(
                        fontSize: 14.sp, color: Theme.of(context).canvasColor),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.eventData!.aboutResource}",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Theme.of(context).canvasColor),
                      ),
                      Text(
                        "${widget.eventData!.social}",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Theme.of(context).canvasColor),
                      ),
                    ],
                  ),
                ),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() => _aboutResourceExpanded = expanded);
              },
            ),
            SizedBox(
              height: getDeviceHeight(context) * 0.02,
            ),
            ExpansionTile(
              initiallyExpanded: true,
              backgroundColor: Theme.of(context).highlightColor,
              collapsedBackgroundColor: Theme.of(context).highlightColor,
              title: Text(
                "Venue",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Theme.of(context).canvasColor,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                _venueExpanded
                    ? Icons.arrow_drop_down_circle
                    : Icons.arrow_drop_down,
                color: Theme.of(context).primaryColor,
                size: getDeviceWidth(context) * 0.1,
              ),
              children: [
                ListTile(
                  title: Text(
                    "${widget.eventData!.venue}",
                    style: TextStyle(
                        fontSize: 14.sp, color: Theme.of(context).canvasColor),
                  ),
                ),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() => _venueExpanded = expanded);
              },
            ),
            SizedBox(
              height: getDeviceHeight(context) * 0.02,
            ),
            ExpansionTile(
              initiallyExpanded: true,
              backgroundColor: Theme.of(context).highlightColor,
              collapsedBackgroundColor: Theme.of(context).highlightColor,
              title: Text(
                "Scheduled Date",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Theme.of(context).canvasColor,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                _timingsExpanded
                    ? Icons.arrow_drop_down_circle
                    : Icons.arrow_drop_down,
                color: Theme.of(context).primaryColor,
                size: getDeviceWidth(context) * 0.1,
              ),
              children: [
                ListTile(
                  title: Text(
                    "The Event is schedule to start on ${widget.eventData!.startDate} and end on ${widget.eventData!.endDate}",
                    style: TextStyle(
                        fontSize: 14.sp, color: Theme.of(context).canvasColor),
                  ),
                ),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() => _timingsExpanded = expanded);
              },
            ),
            SizedBox(
              height: getDeviceHeight(context) * 0.02,
            ),

            // Register Button

            // if (pressed == false)

            //Proper Implemet of register.
            //Problem - We need 1 student ID to register for one event ID only once
            //Solution - Requirements 1. student ID & registartion details student ID
            //                        2. event ID & registartion details event ID
            //
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EventResponses(eventId: widget.eventData!.id!))),
              child: Container(
                alignment: Alignment.center,
                height: getDeviceHeight(context) * 0.075,
                width: getDeviceWidth(context) * 0.75,
                padding: EdgeInsets.all(getDeviceHeight(context) * 0.01),
                decoration: BoxDecoration(
                  // color: Theme.of(context).primaryColor,
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                //Dynamic text data added below
                child: Text(
                  "Responses",
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).highlightColor),
                ),
              ),
            ),
            // if (pressed == true &&
            //     registerDetails.event!.id == widget.eventData!.id &&
            //     registerDetails.usn == widget.user!.usn)
            //   InkWell(
            //     onTap: null,
            //     child: Container(
            //       alignment: Alignment.center,
            //       height: getDeviceHeight(context) * 0.075,
            //       width: getDeviceWidth(context) * 0.75,
            //       padding: EdgeInsets.all(getDeviceHeight(context) * 0.01),
            //       decoration: BoxDecoration(
            //         // color: Theme.of(context).primaryColor,
            //         color: Colors.grey,
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       //Dynamic text data added below
            //       child: Text(
            //         text,
            //         style: TextStyle(
            //             fontSize: 20, color: Theme.of(context).highlightColor),
            //       ),
            //     ),
            //   ),
            SizedBox(
              height: getDeviceHeight(context) * 0.02,
            ),

            //Add Pictures
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EventPictures(eventData: widget.eventData!)));
              },
              child: Container(
                alignment: Alignment.center,
                height: getDeviceHeight(context) * 0.075,
                width: getDeviceWidth(context) * 0.75,
                padding: EdgeInsets.all(getDeviceHeight(context) * 0.01),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "View Pictures",
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).highlightColor),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).highlightColor,
    );
  }
}
