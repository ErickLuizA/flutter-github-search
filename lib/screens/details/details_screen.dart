import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_search/screens/details/components/ui_state_widget.dart';
import 'package:github_search/viewmodels/details_viewmodel.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  final String? userName;

  DetailsScreen({
    @required this.userName,
  });

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();

    getUser();

    getRepos();
  }

  void getUser() {
    Provider.of<DetailsViewModel>(
      context,
      listen: false,
    ).getUser(widget.userName!);
  }

  void getRepos() {
    Provider.of<DetailsViewModel>(
      context,
      listen: false,
    ).getRepos(widget.userName!);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DetailsViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.dark,
        backgroundColor: Theme.of(context).backgroundColor,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset('assets/logo-horizontal.svg'),
        ),
        leadingWidth: MediaQuery.of(context).size.width / 3,
        actions: [
          BackButton(),
        ],
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: uiStateWidget(
          viewModel.uiState,
          viewModel.listState,
          viewModel.user,
          viewModel.repos,
          getUser,
          getRepos,
        ),
      ),
    );
  }
}
