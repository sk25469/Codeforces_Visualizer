class Problem {
  final IndProblem indProblem;
  final String programmingLanguage;
  final String verdict;

  Problem({
    required this.programmingLanguage,
    required this.indProblem,
    required this.verdict,
  });

  factory Problem.fromJson(Map<String, dynamic> json) {
    return Problem(
      indProblem: IndProblem.fromJson(json['problem']),
      programmingLanguage: json['programmingLanguage'],
      verdict: json['verdict'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'indProblem': indProblem,
      'programmingLanguage': programmingLanguage,
      'verdict': verdict,
    };
  }
}

class IndProblem {
  final int rating;
  final List<String> tags;

  IndProblem({
    required this.rating,
    required this.tags,
  });

  factory IndProblem.fromJson(Map<String, dynamic> json) {
    return IndProblem(
      rating: json['rating'].cast<int>(),
      tags: json['tags'].cast<List<String>>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'tags': tags,
    };
  }
}
