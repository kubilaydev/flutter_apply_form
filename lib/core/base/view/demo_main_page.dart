import 'package:flutter/material.dart';
import 'package:flutter_apply_form/core/components/main_page/Identification.dart';

import '../../components/main_constants.dart';
import '../../components/main_page/signin_appbar.dart';

///
class DemoHomePage extends StatefulWidget {
  ///
  DemoHomePage({
    Key? key,
  }) : super(key: key);

  ///

  @override
  _DemoHomePageState createState() => _DemoHomePageState();
}

class _DemoHomePageState extends State<DemoHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: Identification()),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
