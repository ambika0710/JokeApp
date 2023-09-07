
import '../entities/joke.dart';

abstract class JokeRepository {
  Future<List<JokeEntity>> getJokes();
}
