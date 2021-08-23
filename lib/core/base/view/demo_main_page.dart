import 'package:flutter/material.dart';
import '../../components/main_page/Identification.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: Identification()),
      ),
    );
  }
}
