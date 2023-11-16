import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalkthroughPage extends StatelessWidget {
  final String title;
  final String content;
  final String imagePath;

  const WalkthroughPage({Key? key, required this.title, required this.content, required this.imagePath}) : super(key: key);

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
          Center(
                child: Image.asset(
                  imagePath, // Use the exact path of your image asset
                  width: 300, // Adjust the size as needed
                  height: 300, // Adjust the size as needed
                ),
              ),
          SizedBox(height: 32), // Space between the image and title
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