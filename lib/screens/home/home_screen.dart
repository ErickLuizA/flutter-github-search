import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.dark,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        width: double.infinity,
        padding: EdgeInsets.only(right: 40, left: 40),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset('assets/logo-vertical.svg'),
                SizedBox(height: 20),
                TextField(
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(
                    labelText: 'Enter user name',
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  controller: _controller,
                ),
                SizedBox(height: 20),
                MaterialButton(
                  onPressed: () {
                    final String userName = _controller.text;

                    if (userName.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please type a name to be searched'),
                        ),
                      );
                    } else {
                      Navigator.of(context).pushNamed('/details', arguments: {
                        "user_name": userName,
                      });
                    }
                  },
                  color: Theme.of(context).primaryColor,
                  minWidth: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  child: Text(
                    "Search",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
