import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unlimit_task/presentation/pages/joke_list_screen.dart';
import 'package:unlimit_task/presentation/viewmodels/joke_list.dart';
import 'data/repositories/joke_repository_impl.dart';
import 'domain/usecases/get_jokes_usecase.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => JokeListViewModel(GetJokesUsecase(JokeRepositoryImpl())),
        ),
      ],
      child: MaterialApp(
        title: 'Jokes App',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: JokeListScreen(),
      ),
    );
  }
}
