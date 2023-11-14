import 'package:flutter/material.dart';
import 'package:bartenders_and_more/screens/walkthough.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToWalkthrough();
  }

  _navigateToWalkthrough() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => WalkthroughScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Assuming your splash screen background is black
      body: Center(
        child: Image.asset(
          'assets/images/appicon.png', // Use the path to your asset image
          width: 450, // Set the width to the size you need
          height: 450, // Set the height to the size you need
        ),
      ),
    );
  }
}

