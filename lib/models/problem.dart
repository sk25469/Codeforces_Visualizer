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
    var uri = Uri.parse('https://codeforces.com/api/user.status?handle=' + _userName);

    try {
      print(_userName);
      final response = await http.get(uri);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      final allProblems = extractedData['result'] as List<dynamic>;

      List<Problem> solvedProblems = [];

      for (int i = 0; i < allProblems.length; i++) {
        String verdict = allProblems[i]['verdict'];
        String programmingLang = allProblems[i]['programmingLanguage'];

        var problemData = allProblems[i]['problem'] as Map<String, dynamic>;

        int rating = problemData['rating'] ?? 0;
        List<dynamic> tagsList = problemData['tags'];
        List<String> tags = [];

        for (int i = 0; i < tagsList.length; i++) {
          tags.add(tagsList[i] as String);
        }

        // print("rating is " + rating.toString() + " verdict is " + verdict);

        if (verdict == "OK") {
          solvedProblems.add(
            Problem(
              programmingLanguage: programmingLang,
              rating: rating,
              tags: tags,
              verdict: verdict,
            ),
          );
        }
      }

      // print(solvedProblems[0].rating);

      return solvedProblems;
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }
}
