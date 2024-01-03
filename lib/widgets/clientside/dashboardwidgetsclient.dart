import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class EventCard extends StatelessWidget {
  final String eventName;
  final String eventDate;
  final String eventLocation;

  EventCard({
    required this.eventName,
    required this.eventDate,
    required this.eventLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black, // Adjust the color to match your design
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              eventName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // Show ellipsis when text overflows
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6.0),
            Row(
              children: <Widget>[
                Icon(Icons.calendar_today, color: Colors.grey, size: 16.0),
                SizedBox(width: 4.0),
                Expanded(
                  child: Text(
                    eventDate,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis, // Show ellipsis when text overflows
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.0),
            Row(
              children: <Widget>[
                Icon(Icons.location_on, color: Colors.grey, size: 16.0),
                SizedBox(width: 4.0),
                Expanded(
                  child: Text(
                    eventLocation,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis, // Show ellipsis when text overflows
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            TextButton(
              onPressed: () {
                // TODO: Handle details button tap
              },
              child: Text(
                'Details',
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey[850], // Use a darker shade for the button
                primary: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class TeamCard extends StatelessWidget {
  final String imagePath;
  final String teamName;
  final double rating;
  final String location;
  final String experience;

  TeamCard({
    required this.imagePath,
    required this.teamName,
    required this.rating,
    required this.location,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160, // Fixed width for the card
      child: Card(
        color: Colors.grey[850], // Dark card background
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text(
                    teamName,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: <Widget>[
                      // Use Icon or Image.asset for star icon
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(
                        ' $rating',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  ],),
                  SizedBox(height: 4),
                  Row(children: [
                    Icon(Icons.location_pin,color: Colors.white,size: 20),
                    SizedBox(width: 4),
                    Text(
                      location,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                  ],),
                  SizedBox(height: 4),
                  Row(children: [
                    Icon(Icons.calendar_today,color: Colors.white, size: 20),
                    SizedBox(width: 4),
                    Text(
                      experience,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],)               
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
