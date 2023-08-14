import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sdk/screens/home_screen.dart';


class LoadingScreen extends StatefulWidget {
  static const String id = 'loading_screen';
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goToScreen();
  }

  void goToScreen() async {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        // Here you can write your code for open new view
      });
      Navigator.popAndPushNamed(context, HomeScreen.id);
 //  print('Booool value after: $_isLoggedIn');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            ),
        child: SpinKitCircle(
          color: Colors.blue,
          size: 50.0,
        ),
      ),
    );
  }
}
