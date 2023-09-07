import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../domain/entities/joke.dart';
import '../../domain/repositories/joke_repository.dart';
import '../models/joke_model.dart';

class JokeRepositoryImpl implements JokeRepository {
  @override
  Future<List<JokeEntity>> getJokes() async {
    final response = await http.get(Uri.parse('https://geek-jokes.sameerkumar.website/api?format=json'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final String joke = jsonData['joke'];
      return [JokeEntity(joke: joke)];
    } else {
      throw Exception('Failed to load jokes');
    }
  }
}




