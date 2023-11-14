import 'package:flutter/material.dart';
import 'package:bartenders_and_more/screens/walkthough.dart';
import 'package:bartenders_and_more/widgets/splashwidget.dart';
import 'package:bartenders_and_more/screens/signin.dart';
import 'package:bartenders_and_more/screens/joinasrole.dart';
import 'package:bartenders_and_more/screens/joinclient.dart';
import 'package:bartenders_and_more/screens/joinstaff.dart';
import 'package:bartenders_and_more/screens/signupclient.dart';
import 'package:bartenders_and_more/screens/signupstaff.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bartenders and More',
      home: SplashScreen(),
      routes: {
        '/walkthrough': (context) => WalkthroughScreen(),
        '/signin': (context) => SignInScreen(),
        '/join': (context) => JoinAsRoleScreen(),
        '/joinClient': (context) => LocationScreen(),
        '/joinStaff': (context) => LocationScreenStaff(),
        '/signupClient': (context) => SignUpClientScreen(),
        '/signupStaff': (context) => SignUpStaffScreen(),
        // Define other routes here
      },
    );
  }
}

