import 'package:flutter/material.dart';
import 'package:github_search/models/repository.dart';

class RepoListWidget extends StatelessWidget {
  final List<Repository>? repositories;

  const RepoListWidget({
    this.repositories,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: repositories?.length,
      itemBuilder: (context, index) {
        final repo = repositories?[index];

        return Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            color: Theme.of(context).cardColor,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(repo?.name ?? ''),
                SizedBox(height: 5),
                Text(repo?.description ?? ''),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text("${repo?.stargazersCount}"),
                    SizedBox(width: 10),
                    Icon(
                      Icons.share,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text("${repo?.forksCount}"),
                    SizedBox(width: 10),
                    Icon(
                      Icons.computer,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text(repo?.language ?? ''),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
