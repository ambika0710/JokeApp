
import '../entities/joke.dart';
import '../repositories/joke_repository.dart';

class GetJokesUsecase {
  final JokeRepository repository;

  GetJokesUsecase(this.repository);

  Future<List<JokeEntity>> execute() async {
    return await repository.getJokes();
  }
}
