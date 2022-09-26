//pre-defined imports
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:facultyapp/services/event_service.dart';
import 'package:facultyapp/views/events/eventdetails.dart';

//user-defined imports
import '../../interfaces/event_interface.dart';

import '../../utils/configurations.dart';
import '../events/add_event.dart';
import 'user_settings_page.dart';
import '../events/eventdetails.dart';
import '../../models/events_model.dart';
import '../../services/event_service.dart';

// Global Declaration

// 1. Declare EventsModelClass
late Future<List<EventsModel>> data;

// 2. Create an object of CollegeEvents that fetches API
final Events _college = CollegeEvents();

class UserPage extends StatefulWidget {
  UserPage({
    super.key,
    this.user,
  });

  var user;
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> with TickerProviderStateMixin {
  late TabController _tabBarContoller;

  @override
  void initState() {
    //Tab bar

    _tabBarContoller = TabController(length: 2, vsync: this);

    //GET API -> getEvents
    data = _college.eventsFeed();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    final deviceWidth = getDeviceWidth(context);
    final deviceHeight = getDeviceHeight(context);
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        // elevation: 0,
        toolbarHeight: deviceHeight * 0.10,
        backgroundColor: Theme.of(context).highlightColor,
        centerTitle: true,
        title: Text(
          "Faculty Events",
          style: TextStyle(
              fontSize: 24.sp,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),

        actions: [
          IconButton(
            padding: EdgeInsets.all(deviceWidth * 0.05),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UserSettingsPage(),
              ),
            ),
            icon: Icon(
              color: Theme.of(context).primaryColor,
              Icons.account_circle,
              // size: 40,
            ),
            iconSize: deviceHeight * 0.05,
            color: Colors.black,
          )
        ],
      ),
      body: Container(
        height: deviceHeight,
        child: Column(
          children: [
            TabBar(
              indicatorWeight: 2,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Theme.of(context).primaryColor),
              indicatorColor: Theme.of(context).primaryColor,
              // isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Colors.grey,
              labelColor: Theme.of(context).highlightColor,
              controller: _tabBarContoller,
              tabs: [
                Tab(
                  // text: "Upcoming",
                  child: Padding(
                    child: Text("Upcoming"),
                    padding: EdgeInsets.symmetric(
                        horizontal: getDeviceWidth(context) * 0.1),
                  ),
                ),
                Tab(
                  // text: "Upcoming",
                  child: Padding(
                    child: Text("Completed"),
                    padding: EdgeInsets.symmetric(
                        horizontal: getDeviceWidth(context) * 0.1),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            Container(
              height: deviceHeight * 0.7,
              child: TabBarView(
                controller: _tabBarContoller,
                children: [
                  Upcoming(),
                  Completed(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        foregroundColor: Theme.of(context).highlightColor,
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddEvents(),
          ),
        ),
      ),
    );
  }
}

getEventsFeed() {
  return data = _college.eventsFeed();
}

class Upcoming extends StatefulWidget {
  const Upcoming({super.key});

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    final deviceWidth = getDeviceWidth(context);
    final deviceHeight = getDeviceHeight(context);
    return RefreshIndicator(
      onRefresh: () {
        setState(() {
          // getEventsFeed();
        });
        return getEventsFeed();
      },
      child: Container(
        child: FutureBuilder<List<EventsModel>>(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              List<EventsModel> eventList = snapshot.data!;

              return ListView(
                children: eventList
                    .map(
                      (event) => EventFeed(
                          deviceWidth: deviceWidth,
                          deviceHeight: deviceHeight,
                          unitHeightValue: unitHeightValue,
                          eventData: event),
                    )
                    .where((element) => DateTime.now()
                        .isBefore(DateTime.parse(element.eventData!.endDate!)))
                    .toList(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Upcoming -> ${snapshot.data}'),
              );
            } else if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            }
            return Center(child: Text("null"));
          },
        ),
      ),
    );
  }
}

class Completed extends StatefulWidget {
  const Completed({super.key});

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  @override
  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    final deviceWidth = getDeviceWidth(context);
    final deviceHeight = getDeviceHeight(context);
    return Container(
      child: FutureBuilder<List<EventsModel>>(
        future: data,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            List<EventsModel> eventList = snapshot.data!;

            return RefreshIndicator(
              color: Theme.of(context).primaryColor,
              onRefresh: () {
                setState(() {
                  // getEventsFeed();
                });
                return getEventsFeed();
              },
              child: ListView(
                children: eventList
                    .map(
                      (event) => EventFeed(
                          deviceWidth: deviceWidth,
                          deviceHeight: deviceHeight,
                          unitHeightValue: unitHeightValue,
                          eventData: event),
                    )
                    .where((element) => DateTime.now()
                        .isAfter(DateTime.parse(element.eventData!.endDate!)))
                    .toList(),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Completed -> ${snapshot.error}'),
            );
          } else if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          }
          return Center(child: Text("null"));
        },
      ),
    );
  }
}

class EventFeed extends StatelessWidget {
  const EventFeed({
    Key? key,
    required this.deviceWidth,
    required this.deviceHeight,
    required this.unitHeightValue,
    required this.eventData,
  }) : super(key: key);

  final deviceWidth;
  final deviceHeight;
  final EventsModel? eventData;
  final double unitHeightValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(deviceWidth * 0.03),
      constraints: BoxConstraints(maxHeight: deviceHeight * 0.22),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          // picture
          Container(
            margin: EdgeInsets.only(right: deviceWidth * 0.05),
            width: deviceWidth * 0.38,
            height: deviceHeight * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                // To fit the image width within the container
                fit: BoxFit.cover,

                image: NetworkImage(
                  "${eventData!.image}",
                ),
              ),
            ),
          ),
          // second box
          SizedBox(
            width: deviceWidth * 0.38,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${eventData!.eventTitle}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 2.5 * unitHeightValue),
                ),
                SizedBox(
                  height: deviceHeight * 0.015,
                ),
                Text(
                  'Start date: ${eventData!.startDate}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 1.5 * unitHeightValue,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Text(
                  'Venue: ${eventData!.venue}',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 1.5 * unitHeightValue,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.05,
                ),
                Text(
                  "Duration: 3 Days",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 1.5 * unitHeightValue,
                  ),
                ),
              ],
            ),
          ),
          //third box
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventDetails(
                      eventData: eventData,
                    ),
                  ),
                ),
                icon: Icon(
                  Icons.arrow_circle_right,
                  color: Theme.of(context).primaryColor,
                  size: 40,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
