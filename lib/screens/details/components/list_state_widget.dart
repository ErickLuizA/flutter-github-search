import 'package:flutter/material.dart';
import 'package:github_search/models/repository.dart';
import 'package:github_search/screens/details/components/repo_list_widget.dart';
import 'package:github_search/viewmodels/details_viewmodel.dart';

Widget? listStateWidget(
  ListState listState,
  List<Repository>? repositories,
  Function getRepos,
) {
  if (listState == ListState.Loading) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  if (listState == ListState.Error) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.warning,
          color: Colors.orange[700],
          size: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 30,
          ),
          child: Text(
            "Error while loading list",
          ),
        ),
        TextButton(
          onPressed: () {
            getRepos();
          },
          child: Text('Try again'),
        ),
      ],
    );
  }
  if (listState == ListState.Success) {
    return RepoListWidget(repositories: repositories);
  }
}
