import 'package:codeforces_visualizer/models/contest.dart';
import 'package:flutter/material.dart';

class ContestDetail extends StatelessWidget {
  final List<UpcomingContest> upcomingContest;

  ContestDetail({
    required this.upcomingContest,
  });

  @override
  Widget build(BuildContext context) {
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
                    Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Start Time',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 3.5),
                        Text(
                          DateTime.fromMillisecondsSinceEpoch(
                                      upcomingContest[index].startTime * 1000)
                                  .month
                                  .toString() +
                              " " +
                              DateTime.fromMillisecondsSinceEpoch(
                                      upcomingContest[index].startTime * 1000)
                                  .day
                                  .toString(),
                        ),
                      ],
                    ),
                    Column(
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
                        Text(upcomingContest[index].contestName),
                      ],
                    ),
                    Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Duration',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 3.5),
                        Text(
                          (upcomingContest[index].duration ~/ (60 * 60))
                                  .toString() +
                              " : " +
                              ((upcomingContest[index].duration / 60) % 60)
                                  .toString(),
                        ),
                      ],
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
