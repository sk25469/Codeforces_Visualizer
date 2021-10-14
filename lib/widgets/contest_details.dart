import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';

import 'package:codeforces_visualizer/models/upcoming_contest.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

/// takes the [UpcomingContest] and displays the contents
class ContestDetail extends StatefulWidget {
  final List<UpcomingContest> upcomingContest;

  ContestDetail({
    required this.upcomingContest,
  });

  @override
  State<ContestDetail> createState() => _ContestDetailState();
}

class _ContestDetailState extends State<ContestDetail> {
  final _url = "https://codeforces.com/contests";

  void _launchURL() async => await launch(_url);

  Map<int, bool> isAdded = {};
  void _addToCalender(int index, List<UpcomingContest> upcomingContest) {
    int eventStartTime = upcomingContest[index].startTime;
    // int eventDuration = upcomingContest[index].duration;
    var evaluatedDate = DateTime.fromMillisecondsSinceEpoch(eventStartTime * 1000);
    var year = evaluatedDate.year;
    var month = evaluatedDate.month;
    var day = evaluatedDate.day;
    var hour = evaluatedDate.hour;
    var min = evaluatedDate.minute;
    final Event event = Event(
      title: upcomingContest[index].contestName,
      description: 'Codeforces Round',
      location: 'Online',
      startDate: DateTime(year, month, day, hour, min).subtract(
        const Duration(minutes: 30),
      ),
      endDate: DateTime(year, month, day, hour, min).add(
        const Duration(hours: 3),
      ),
    );
    setState(() {
      Add2Calendar.addEvent2Cal(event);
      print("Added to calender");
      if (isAdded[index] == null) {
        isAdded[index] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 5,
            right: 5,
            top: 3,
            bottom: 3,
          ),
          child: Card(
            elevation: 5,
            child: InkWell(
              onTap: _launchURL,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // contest start time
                    Container(
                      width: mediaQuery * 0.15,
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            'Start Time',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                overflow: TextOverflow.clip),
                          ),
                          const SizedBox(height: 3.5),
                          Text(
                            DateTime.fromMillisecondsSinceEpoch(
                                        widget.upcomingContest[index].startTime * 1000)
                                    .day
                                    .toString() +
                                "/" +
                                DateTime.fromMillisecondsSinceEpoch(
                                        widget.upcomingContest[index].startTime * 1000)
                                    .month
                                    .toString() +
                                "\n" +
                                DateTime.fromMillisecondsSinceEpoch(
                                        widget.upcomingContest[index].startTime * 1000)
                                    .hour
                                    .toString() +
                                ":" +
                                DateTime.fromMillisecondsSinceEpoch(
                                        widget.upcomingContest[index].startTime * 1000)
                                    .minute
                                    .toString(),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: mediaQuery * 0.45,
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            'Contest Name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 3.5),
                          Text(
                            widget.upcomingContest[index].contestName,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: mediaQuery * 0.18,
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            'Duration\n   (min)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 3.5),
                          Text(
                            // (upcomingContest[index].duration ~/ (60 * 60))
                            //         .toString() +
                            //     " : " +
                            ((widget.upcomingContest[index].duration ~/ 60)).toString(),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: mediaQuery * 0.12,
                      child: IconButton(
                        onPressed: isAdded[index] != null
                            ? null
                            : () async {
                                var status = await Permission.calendar.request();
                                if (status.isGranted) {
                                  _addToCalender(index, widget.upcomingContest);
                                } else if (status.isDenied) {
                                  return;
                                }
                                // else {
                                //   showDialog(
                                //     context: context,
                                //     builder: (BuildContext context) => AlertDialog(
                                //       title: const Text('Calender Permission'),
                                //       content: const Text(
                                //           'This app needs calender access to create events'),
                                //       actions: <Widget>[
                                //         RaisedButton(
                                //           child: const Text('Deny'),
                                //           onPressed: () => Navigator.of(context).pop(),
                                //         ),
                                //         RaisedButton(
                                //           child: const Text('Settings'),
                                //           onPressed: () => openAppSettings(),
                                //         ),
                                //       ],
                                //     ),
                                //   );
                                // }
                              },
                        icon: isAdded[index] != null
                            ? const Icon(Icons.notifications_active)
                            : const Icon(Icons.notification_add),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      itemCount: widget.upcomingContest.length,
    );
  }
}
