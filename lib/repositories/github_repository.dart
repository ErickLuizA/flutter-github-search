import 'dart:convert';

import 'package:github_search/models/repository.dart';
import 'package:github_search/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class GithubRepository {
  Future<Either<Exception, User>>? getUser(String userName) async {
    final url = Uri.https('api.github.com', '/users/$userName');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return Right(User.fromJson(data));
      } else {
        return Left(Exception());
      }
    } catch (e) {
      return Left(Exception(e));
    }
  }

  Future<Either<Exception, List<Repository>>>? getRepos(String userName) async {
    final url = Uri.https('api.github.com', '/users/$userName/repos');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Iterable data = jsonDecode(response.body);

        final list = data.map((e) => Repository.fromJson(e)).toList();

        return Right(list);
      } else {
        return Left(Exception());
      }
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
