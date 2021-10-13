import 'package:codeforces_visualizer/models/upcoming_contest.dart';

import 'package:codeforces_visualizer/widgets/contest_details.dart';

import 'package:flutter/material.dart';

class ContestScreen extends StatelessWidget {
  static const routeName = '/contest-screen';
  const ContestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: (mediaQuery.size.height -
                  mediaQuery.padding.top -
                  mediaQuery.padding.bottom) *
              0.2,
          width: double.infinity,
          child: const Center(
            child: Text(
              'Upcoming Contests',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        _buildBody(context),
      ],
    );
  }

  FutureBuilder<List<UpcomingContest>> _buildBody(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return FutureBuilder<List<UpcomingContest>>(
      future: Contests().fetchAndGetContests(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final upcomingContests = snapshot.data;
          return _buildListView(
            mediaQuery: _mediaQuery,
            contests: upcomingContests,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

// ignore: camel_case_types
class _buildListView extends StatelessWidget {
  _buildListView({
    Key? key,
    required this.mediaQuery,
    required this.contests,
  }) : super(key: key);

  final MediaQueryData mediaQuery;
  final List<UpcomingContest>? contests;

  @override
  Widget build(BuildContext context) {
    final List<UpcomingContest> _upcomingContests = [];
    // print(contests.length);
    for (int i = 0; i < contests!.length; i++) {
      if (contests![i].phase == "BEFORE") {
        _upcomingContests.add(
          UpcomingContest(
            duration: contests![i].duration,
            contestName: contests![i].contestName,
            startTime: contests![i].startTime,
            phase: contests![i].phase,
          ),
        );
      }
    }

    _upcomingContests.sort((a, b) => a.compareTo(b));

    return Container(
      height:
          (mediaQuery.size.height - mediaQuery.padding.top - mediaQuery.padding.bottom) *
              0.59,
      child: _upcomingContests.isNotEmpty
          ? ContestDetail(upcomingContest: _upcomingContests)
          : const Text('No upcoming Contests Ahead!'),
    );
  }
}
