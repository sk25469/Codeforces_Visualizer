class Problem {
  final int rating;
  final List<String> tags;
  final String programmingLanguage;
  final String verdict;

  Problem({
    required this.programmingLanguage,
    required this.rating,
    required this.tags,
    required this.verdict,
  });

  factory Problem.fromJson(Map<String, dynamic> json) {
    return Problem(
      rating: json['problem']['rating'],
      tags: json['problem']['tags'],
      programmingLanguage: json['programmingLanguage'],
      verdict: json['verdict'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'tags': tags,
      'programmingLanguage': programmingLanguage,
      'verdict': verdict,
    };
  }
}
