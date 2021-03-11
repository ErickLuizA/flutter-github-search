import 'package:flutter/material.dart';
import 'package:github_search/repositories/github_repository.dart';
import 'package:github_search/screens/details/details_screen.dart';
import 'package:github_search/theme.dart';
import 'package:github_search/viewmodels/details_viewmodel.dart';
import 'package:provider/provider.dart';

import 'screens/home/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (BuildContext context) {
              return HomeScreen();
            },
          );
        }

        if (settings.name == '/details') {
          final args = settings.arguments as Map;

          return MaterialPageRoute(
            builder: (BuildContext context) {
              return ChangeNotifierProvider(
                create: (context) => DetailsViewModel(GithubRepository()),
                child: DetailsScreen(
                  userName: args['user_name'],
                ),
              );
            },
          );
        }
      },
    );
  }
}
