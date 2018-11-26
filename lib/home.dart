import 'package:flutter/material.dart';
import 'package:noticias/page/home/home_page.dart';
import 'package:noticias/widget/drawer_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(_pageController),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
            Scaffold(
              drawer: DrawerWidget(_pageController),
              body: HomePage(),
            ),
        ],
      ),
    );
  }
}
