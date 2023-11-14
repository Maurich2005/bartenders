import 'package:flutter/material.dart';

class WalkthroughPage extends StatelessWidget {
  final String title;
  final String content;

  const WalkthroughPage({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.black, // Set the background color to black
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end, // Align text to the bottom of the screen
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Set the text color to white
            ),
          ),
          SizedBox(height: 8),
          Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white, // Set the text color to white
            ),
          ),
          SizedBox(height: 64),
          
          SizedBox(height: 32), // Add space below the button
        ],
      ),
    );
  }
}