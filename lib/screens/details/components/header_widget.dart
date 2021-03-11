import 'package:flutter/material.dart';

import 'package:github_search/models/user.dart';

class HeaderWidget extends StatelessWidget {
  final User? user;

  const HeaderWidget({
    @required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Image.network(
            user?.avatarUrl ?? '',
            width: MediaQuery.of(context).size.width / 2.5,
          ),
          SizedBox(height: 10),
          Text(
            user?.name ?? user?.login ?? '',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(user?.email ?? ''),
          Text(user?.bio ?? ''),
          Row(
            children: [
              Icon(
                Icons.people,
                color: Theme.of(context).primaryColor,
              ),
              Text("${user?.followers}"),
              SizedBox(width: 10),
              Icon(
                Icons.people_alt_outlined,
                color: Theme.of(context).primaryColor,
              ),
              Text("${user?.following}"),
            ],
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              color: Theme.of(context).cardColor,
              width: MediaQuery.of(context).size.width / 2.5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Text("Total Repositories"),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.share,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(width: 10),
                        Text("${user?.publicRepos}"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
