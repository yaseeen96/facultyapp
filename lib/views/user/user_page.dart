//pre-defined imports
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:facultyapp/models/faculty_login_model.dart';
import 'package:facultyapp/views/login/login_page.dart';

//user-defined imports
import '../../utils/configurations.dart';
import 'user_settings_page.dart';
// import '../event/event_detail.dart';

class UserPage extends StatefulWidget {
  const UserPage({
    super.key,
  });

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> with TickerProviderStateMixin {
  late TabController _tabBarContoller;

  @override
  void initState() {
    // TODO: implement initState
    _tabBarContoller = TabController(length: 2, vsync: this);
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
        centerTitle: false,
        title: Text(
          "Welcome, Yaseen",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 2.2 * unitHeightValue,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.all(deviceWidth * 0.05),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserSettingsPage())),
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
              isScrollable: true,
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
                        horizontal: getDeviceWidth(context) * 0.08),
                  ),
                ),
                Tab(
                  // text: "Upcoming",
                  child: Padding(
                    child: Text("Completed"),
                    padding: EdgeInsets.symmetric(
                        horizontal: getDeviceWidth(context) * 0.08),
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
    );
  }
}

class Upcoming extends StatelessWidget {
  const Upcoming({super.key});

  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    final deviceWidth = getDeviceWidth(context);
    final deviceHeight = getDeviceHeight(context);
    return Container(
      // height: getDeviceHeight(context) * .4,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          EventFeed(
            deviceWidth: deviceWidth,
            deviceHeight: deviceHeight,
            unitHeightValue: unitHeightValue,
          ),
          SizedBox(
            height: deviceHeight * 0.02,
          ),
          EventFeed(
            deviceWidth: deviceWidth,
            deviceHeight: deviceHeight,
            unitHeightValue: unitHeightValue,
          ),
          SizedBox(
            height: deviceHeight * 0.02,
          ),
          EventFeed(
            deviceWidth: deviceWidth,
            deviceHeight: deviceHeight,
            unitHeightValue: unitHeightValue,
          ),
        ],
      ),
    );
  }
}

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    final deviceWidth = getDeviceWidth(context);
    final deviceHeight = getDeviceHeight(context);
    return Container(
      // height: getDeviceHeight(context) * .4,
      child: ListView(
        children: [
          EventFeed(
            deviceWidth: deviceWidth,
            deviceHeight: deviceHeight,
            unitHeightValue: unitHeightValue,
          ),
          SizedBox(
            height: deviceHeight * 0.02,
          ),
          EventFeed(
            deviceWidth: deviceWidth,
            deviceHeight: deviceHeight,
            unitHeightValue: unitHeightValue,
          ),
          SizedBox(
            height: deviceHeight * 0.02,
          ),
          EventFeed(
            deviceWidth: deviceWidth,
            deviceHeight: deviceHeight,
            unitHeightValue: unitHeightValue,
          ),
        ],
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
  }) : super(key: key);

  final deviceWidth;
  final deviceHeight;
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
                fit: BoxFit.cover,
                image: AssetImage("assets/images/blockchain.png"),
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
                  "Blockchain",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 3 * unitHeightValue),
                ),
                SizedBox(
                  height: deviceHeight * 0.015,
                ),
                Text(
                  'Start date: 04-09-22',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 1.5 * unitHeightValue,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Text(
                  'Venue: Onlinefhdsbfhjdsfhdsbfsdjhfbdshjfbdhjfbdshjfbdshf',
                  style: TextStyle(
                    fontSize: 1.5 * unitHeightValue,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.03,
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
                onPressed: null,
                // onPressed: () => Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => EventDetail(),
                //   ),
                // ),
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
