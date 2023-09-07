import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/joke_list.dart';

class JokeListScreen extends StatefulWidget {
  const JokeListScreen({super.key});

  @override
  _JokeListScreenState createState() => _JokeListScreenState();
}

class _JokeListScreenState extends State<JokeListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<JokeListViewModel>(context, listen: false).fetchJokes();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<JokeListViewModel>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          title: Center(child: Text('Joke App')),
        ),
        body: ListView.builder(
          itemCount: viewModel.jokes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child:  Text(
                    viewModel.jokes[index].joke ?? "",
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
