import 'package:flutter/material.dart';
import 'package:bartenders_and_more/widgets/walkPage.dart';

class WalkthroughScreen extends StatefulWidget {
  @override
  _WalkthroughScreenState createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/signin'); // Use the appropriate route name
  }

  Future<bool> _onWillPop() async {
    if (_currentPage > 0) {
      // If not on the first page, go back to the previous page
      _pageController.previousPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      return Future.value(false); // Prevent exiting the walkthrough
    }
    return Future.value(true); // Allow exiting if on the first page
  }

  Widget _buildDot(int index, bool isActive) {
  return isActive
      ? Container(
          width: 10,
          height: 10,
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(130, 91, 51, 1), // Start color
                Color.fromRGBO(232, 218, 191, 1), // Middle color
                Color.fromRGBO(130, 91, 51, 1), // End color
              ],
            ),
          ),
        )
      : Container(
          width: 10,
          height: 10,
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey, // Non-active dots color
          ),
        );
}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
      backgroundColor: Colors.black, // Set the background color to black
      appBar: AppBar(
        backgroundColor: Colors.black, // Set the AppBar color to black
        elevation: 0, // Remove shadow from AppBar
        actions: <Widget>[
          if (_currentPage != 2) // Show Skip button unless it's the last page
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextButton(
                onPressed: () {
                  _navigateToNextScreen(context);
                },
                child: Text(
                  'Skip',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[850], // Use a grey color from the Material palette
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4), // Padding inside the button
                ),
              ),
            ),
        ],
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: <Widget>[
          WalkthroughPage(
            title: 'Welcome to Bartenders and More!',
            content: 'Unlock the best party experiences! Find and book professional bartenders, servers, and more to elevate your events.',
          ),
          WalkthroughPage(
            title: 'Seamless Hiring, Unforgettable Parties',
            content: 'Browse profiles, read reviews, and hire vetted professionals with ease. Make your next event a memorable one with the right staff.',
          ),
          WalkthroughPage(
            title: 'Flexible Work, Instant Pay',
            content: 'Join our community of service professionals. Enjoy the freedom to work events that fit your schedule and get paid quickly.',
          ),
        ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 100, // Adjust the positioning as needed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(3, (int index) {
                return _buildDot(index, _currentPage == index);
              }),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 15, // Adjust the positioning as needed
            child: Container(
              width: double.infinity, // Full-width button
              height: 48, // Fixed height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), // Adjust for rounded corners
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromRGBO(130, 91, 51, 1), // Start color
                    Color.fromRGBO(232, 218, 191, 1), // Middle color
                    Color.fromRGBO(130, 91, 51, 1), // End color, same as start color
                  ],
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPage < 2) {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    _navigateToNextScreen(context);
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Use only the minimum space needed
                  children: <Widget>[
                    Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.black, // Set the text color to black
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward, // Add arrow forward icon
                      color: Colors.black, // Set the icon color to black
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, // Make the button background transparent
                  onSurface: Colors.transparent, // Ensure overlay colors are transparent too
                  shadowColor: Colors.transparent, // No shadow for transparent background
                  elevation: 0, // Remove elevation
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Match the container's border radius
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}