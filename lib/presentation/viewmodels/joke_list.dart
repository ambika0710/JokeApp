import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../domain/entities/joke.dart';
import '../../domain/usecases/get_jokes_usecase.dart';

class JokeListViewModel with ChangeNotifier {
  final GetJokesUsecase getJokesUsecase;

  List<JokeEntity> jokes = [];
  Timer? timer;

  JokeListViewModel(this.getJokesUsecase) {
    fetchJokes();
  }

  void fetchJokes() {
    timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      try {
        List<JokeEntity> newJokes = await getJokesUsecase.execute();
        _updateJokes(newJokes);
      } catch (e) {
        print("Error fetching jokes: $e");
      }
    });
  }

  void _updateJokes(List<JokeEntity> newJokes) {
    if (jokes.length >= 10) {
      jokes.removeRange(0, jokes.length - 1); // Remove oldest jokes
    }
    jokes.addAll(newJokes);
    notifyListeners();
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel the timer when the view model is disposed
    super.dispose();
  }
}
