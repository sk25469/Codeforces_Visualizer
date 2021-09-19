class ProblemDetailByRating implements Comparable {
  final int rating;
  final int quesCnt;

  ProblemDetailByRating(this.quesCnt, this.rating);

  @override
  int compareTo(other) {
    if (rating < other.rating) {
      return 1;
    }

    return 0;
  }
}
