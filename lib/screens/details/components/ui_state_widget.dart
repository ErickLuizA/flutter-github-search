import 'package:flutter/material.dart';
import 'package:github_search/models/repository.dart';
import 'package:github_search/models/user.dart';
import 'package:github_search/screens/details/components/header_widget.dart';
import 'package:github_search/screens/details/components/list_state_widget.dart';
import 'package:github_search/viewmodels/details_viewmodel.dart';

Widget? uiStateWidget(
  UIState uiState,
  ListState listState,
  User? user,
  List<Repository>? repositories,
  Function getUser,
  Function getRepos,
) {
  if (uiState == UIState.Loading) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  if (uiState == UIState.Error) {
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
            "Error while loading user info",
          ),
        ),
        TextButton(
          onPressed: () {
            getUser();
          },
          child: Text('Try again'),
        ),
      ],
    );
  }
  if (uiState == UIState.Success) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: [
          HeaderWidget(user: user),
          listStateWidget(
            listState,
            repositories,
            getRepos,
          )!,
        ],
      ),
    );
  }
}
