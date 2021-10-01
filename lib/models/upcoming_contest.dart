import 'package:http/http.dart' as http;
import 'dart:convert';

class UpcomingContest implements Comparable {
  final String contestName;
  final int startTime;
  final int duration;
  final String phase;

  UpcomingContest({
    required this.contestName,
    required this.duration,
    required this.startTime,
    required this.phase,
  });

  @override
  int compareTo(other) {
    if (startTime < other.startTime) {
      return 0;
    }
    return 1;
  }
}

class Contests {
  List<UpcomingContest> _upcomingContests = [];

  List<UpcomingContest> get contests {
    print(_upcomingContests.length);
    return [..._upcomingContests];
  }

  Future<void> fetchAndGetContests() async {
    var uri = Uri.parse('https://codeforces.com/api/contest.list');
    try {
      final response = await http.get(uri);
      // final List<UpcomingContest> loadedContests = [];

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      // print(extractedData['result']);
      final allContests = extractedData['result'] as List<dynamic>;

      for (int i = 0; i < allContests.length; i++) {
        _upcomingContests.add(
          UpcomingContest(
            contestName: allContests[i]['name'],
            duration: allContests[i]['durationSeconds'],
            startTime: allContests[i]['startTimeSeconds'],
            phase: allContests[i]['phase'],
          ),
        );
      }

      // _upcomingContests = loadedContests;
      print(_upcomingContests[0].contestName);
    } catch (error) {
      rethrow;
    }
  }
}
