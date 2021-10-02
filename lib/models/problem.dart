import 'package:http/http.dart' as http;
import 'dart:convert';

class Problem {
  Problem({
    required this.programmingLanguage,
    required this.rating,
    required this.tags,
    required this.verdict,
  });

  final String programmingLanguage;
  final int rating;
  final List<String> tags;
  final String verdict;
}

class Problems {
  final String _userName;
  Problems(this._userName);

  Future<List<Problem>> fetchProblems() async {
    var uri = Uri.parse('https://codeforces.com/api/user.status?handle=$_userName');

    try {
      final response = await http.get(uri);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      final allProblems = extractedData['result'] as List<dynamic>;

      List<Problem> solvedProblems = [];

      for (int i = 0; i < allProblems.length; i++) {
        String verdict = allProblems[i]['verdict'];
        String programmingLang = allProblems[i]['programmingLanguage'];

        var problemData = allProblems[i]['problem'] as Map<String, dynamic>;

        int rating = problemData['rating'];
        List<String> tags = problemData['tags'];

        solvedProblems.add(
          Problem(
            programmingLanguage: programmingLang,
            rating: rating,
            tags: tags,
            verdict: verdict,
          ),
        );
      }

      return solvedProblems;
    } catch (error) {
      rethrow;
    }
  }
}
