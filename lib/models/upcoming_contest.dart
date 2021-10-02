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
  Future<List<UpcomingContest>> fetchAndGetContests() async {
    var uri = Uri.parse('https://codeforces.com/api/contest.list');
    try {
      final response = await http.get(uri);
      final List<UpcomingContest> loadedContests = [];

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      // print(extractedData['result']);
      final allContests = extractedData['result'] as List<dynamic>;

      for (int i = 0; i < allContests.length; i++) {
        loadedContests.add(
          UpcomingContest(
            contestName: allContests[i]['name'],
            duration: allContests[i]['durationSeconds'],
            startTime: allContests[i]['startTimeSeconds'],
            phase: allContests[i]['phase'],
          ),
        );
      }

      return loadedContests;
    } catch (error) {
      rethrow;
    }
  }
}
