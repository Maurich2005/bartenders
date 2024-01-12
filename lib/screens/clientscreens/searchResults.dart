import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bartenders_and_more/widgets/clientside/dashboardwidgetsclient.dart';

class SearchResults extends StatefulWidget {
  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  final TextEditingController _searchController = TextEditingController();
  

  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    // Make sure to dispose the controller when the widget is removed from the widget tree
    _searchController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 32.0, bottom: 16.0),
              child: TextField(
                controller: _searchController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search here for bartenders',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.black, // Slightly transparent white
                  suffixIcon: IconButton(icon: Icon(Icons.search, color: Colors.grey),onPressed: () {}),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none, // No border when the TextField is not focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.grey, width: 1.0), // Grey border when the TextField is enabled (not focused)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0), // Blue border when the TextField is focused
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 10.0, top: 15.0), // Bottom padding for the fixed button
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
            height: 150,
            child: SearchResultCard(
              imagePath: 'assets/images/girlSearchResult.png', // Replace with your actual image path
              vendorName: 'Miriane Piers',
              rating: 4.9,
              experience: '10 yrs of experience',
              location: 'Brookline, MA',
              price: 'From 25/hr',
            ),
            ),
            Container(
            height: 150,
            child: SearchResultCard(
              imagePath: 'assets/images/girlSearchResult.png', // Replace with your actual image path
              vendorName: 'Miriane Piers',
              rating: 4.9,
              experience: '10 yrs of experience',
              location: 'Brookline, MA',
              price: 'From 25/hr',
            ),
            ),
            Container(
            height: 150,
            child: SearchResultCard(
              imagePath: 'assets/images/girlSearchResult.png', // Replace with your actual image path
              vendorName: 'Miriane Piers',
              rating: 4.9,
              experience: '10 yrs of experience',
              location: 'Brookline, MA',
              price: 'From 25/hr',
            ),
            ),
            Container(
            height: 150,
            child: SearchResultCard(
              imagePath: 'assets/images/girlSearchResult.png', // Replace with your actual image path
              vendorName: 'Miriane Piers',
              rating: 4.9,
              experience: '10 yrs of experience',
              location: 'Brookline, MA',
              price: 'From 25/hr',
            ),
            ),
            Container(
            height: 150,
            child: SearchResultCard(
              imagePath: 'assets/images/girlSearchResult.png', // Replace with your actual image path
              vendorName: 'Miriane Piers',
              rating: 4.9,
              experience: '10 yrs of experience',
              location: 'Brookline, MA',
              price: 'From 25/hr',
            ),
            ),
          ],
        ),
      ),
            )
          ],
        ), 
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_list),
            label: 'Planner',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
