import 'package:codeforces_visualizer/models/upcoming_contest.dart';
import 'package:flutter/material.dart';

/// takes the [UpcomingContest] and displays the contents
class ContestDetail extends StatelessWidget {
  final List<UpcomingContest> upcomingContest;

  ContestDetail({
    required this.upcomingContest,
  });

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
              onTap: () {},
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
                                        upcomingContest[index].startTime * 1000)
                                    .day
                                    .toString() +
                                "/" +
                                DateTime.fromMillisecondsSinceEpoch(
                                        upcomingContest[index].startTime * 1000)
                                    .month
                                    .toString() +
                                "\n" +
                                DateTime.fromMillisecondsSinceEpoch(
                                        upcomingContest[index].startTime * 1000)
                                    .hour
                                    .toString() +
                                ":" +
                                DateTime.fromMillisecondsSinceEpoch(
                                        upcomingContest[index].startTime * 1000)
                                    .minute
                                    .toString(),
                          ),
                        ],
                      ),
                    ),

                    const Divider(
                      thickness: 5,
                    ),

                    Container(
                      width: mediaQuery * 0.55,
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
                            upcomingContest[index].contestName,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: mediaQuery * 0.2,
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
                            ((upcomingContest[index].duration ~/ 60)).toString(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      itemCount: upcomingContest.length,
    );
  }
}
