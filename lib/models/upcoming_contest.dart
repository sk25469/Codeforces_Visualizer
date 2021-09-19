class UpcomingContest implements Comparable {
  final String contestName;
  final int startTime;
  final int duration;

  UpcomingContest({
    required this.contestName,
    required this.duration,
    required this.startTime,
  });

  @override
  int compareTo(other) {
    if (startTime < other.startTime) {
      return 0;
    }

    return 1;
  }
}
