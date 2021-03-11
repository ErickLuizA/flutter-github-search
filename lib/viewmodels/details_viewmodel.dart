import 'package:flutter/foundation.dart';
import 'package:github_search/models/repository.dart';
import 'package:github_search/models/user.dart';

import 'package:github_search/repositories/github_repository.dart';

enum UIState { Loading, Error, Success }

enum ListState { Loading, Error, Success }

class DetailsViewModel extends ChangeNotifier {
  final GithubRepository _githubRepository;

  DetailsViewModel(this._githubRepository);

  UIState uiState = UIState.Loading;
  ListState listState = ListState.Loading;

  User? user;
  List<Repository>? repos;

  Future<void> getUser(String userName) async {
    final response = await _githubRepository.getUser(userName);

    response?.fold(
      (failure) {
        uiState = UIState.Error;
      },
      (success) {
        uiState = UIState.Success;
        user = success;
      },
    );

    notifyListeners();
  }

  Future<void> getRepos(String userName) async {
    final response = await _githubRepository.getRepos(userName);

    response?.fold(
      (failure) {
        listState = ListState.Error;
      },
      (success) {
        listState = ListState.Success;
        repos = success;
      },
    );

    notifyListeners();
  }
}
