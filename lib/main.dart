import 'package:bartenders_and_more/screens/clientscreens/confirmPartyDetails.dart';
import 'package:bartenders_and_more/screens/clientscreens/dashboardCL.dart';
import 'package:bartenders_and_more/screens/clientscreens/partyDetails.dart';
import 'package:bartenders_and_more/screens/clientscreens/searchResults.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bartenders_and_more/screens/staffsignup/verifyemailstaff.dart';
import 'package:bartenders_and_more/screens/walkthough.dart';
import 'package:bartenders_and_more/widgets/splashwidget.dart';
import 'package:bartenders_and_more/screens/signin.dart';
import 'package:bartenders_and_more/screens/joinasrole.dart';
import 'package:bartenders_and_more/screens/clientsignup/joinclient.dart';
import 'package:bartenders_and_more/screens/staffsignup/joinstaff.dart';
import 'package:bartenders_and_more/screens/clientsignup/signupclient.dart';
import 'package:bartenders_and_more/screens/staffsignup/signupstaff.dart';
import 'package:bartenders_and_more/screens/clientsignup/verifyemail.dart';
import 'package:bartenders_and_more/screens/clientsignup/termsclient.dart';
import 'package:bartenders_and_more/screens/staffsignup/personaldetails.dart';
import 'package:bartenders_and_more/screens/staffsignup/workdetails.dart';
import 'package:bartenders_and_more/screens/forgotpassword.dart';
import 'package:bartenders_and_more/screens/verificationforgotpassword.dart';
import 'package:bartenders_and_more/screens/createnewpassword.dart';
import 'package:bartenders_and_more/screens/staffsignup/availability.dart';
import 'package:bartenders_and_more/screens/staffsignup/backgroundcheck.dart';
import 'package:bartenders_and_more/screens/clientscreens/homeclient.dart';
import 'package:bartenders_and_more/screens/staffsignup/termsstaff.dart';
import 'package:bartenders_and_more/screens/clientscreens/partyDetails.dart';
import 'package:bartenders_and_more/screens/clientscreens/confirmPartyDetails.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

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
        '/signupClient': (context) => SignUpClientScreen(),
        '/termsClient': (context) => TermsConditionsClientScreen(),
        '/emailVerification': (context) => EmailVerificationScreen(),
        '/joinStaff': (context) => LocationScreenStaff(),
        '/signupStaff': (context) => SignUpStaffScreen(),
        '/emailVerificationStaff': (context) => EmailVerificationStaffScreen(),
        '/personalDetails': (context) => PersonalDetailsScreen(),
        '/workDetails': (context) => WorkDetailsScreen(),
        '/availability': (context) => AvailabilityScreen(),
        '/backgroundCheck': (context) => BackgroundCheckScreen(),
        '/termsStaff': (context) => TermsConditionsStaffScreen(),
        '/sendVerificationForgotPassword': (context) => ForgotPasswordScreen(),
        '/emailVerificationForgotPassword': (context) => EmailVerificationForgotScreen(),
        '/createnewpassword': (context) => CreateNewPassword(),
        // Clients Screens
        '/homeClient': (context) => HomeClientScreen(),
        '/partyDetails' : (context) => PartyDetailsPage(),
        '/confirmPartyDetails' :(context) => PreviewPartyDetailsPage(),
        '/dashboardClient' : (context) => DashboardClient(),
        '/searchResults' : (context) => SearchResults()
      },
    );
  }
}
