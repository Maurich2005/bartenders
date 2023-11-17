import 'package:flutter/material.dart';

class PartyTypeCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onSelect;

  const PartyTypeCard({
    Key? key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        width: 100, // Adjust the width based on your UI design
        padding: EdgeInsets.symmetric(horizontal: 8), // Add padding as needed
        margin: EdgeInsets.all(4), // Add margin as needed
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? const Color.fromARGB(255, 252, 207, 72) : Colors.grey),
          borderRadius: BorderRadius.circular(8), // Match to your design
          // Gradient border when selected
          
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 40, color: Colors.white), // Icon size and color can be adjusted
            Text(label, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}


class ServicesGrid extends StatefulWidget {
  final Function(String, double, IconData) updateSelectedServices;

  ServicesGrid({Key? key, required this.updateSelectedServices}) : super(key: key);
  @override
  _ServicesGridState createState() => _ServicesGridState();
}

class _ServicesGridState extends State<ServicesGrid> {
  final List<Map<String, dynamic>> services = [
    {'icon': Icons.local_bar, 'label': 'Bartender', 'isSelected': true},
    {'icon': Icons.restaurant, 'label': 'Server', 'isSelected': false},
    {'icon': Icons.kitchen, 'label': 'Chef', 'isSelected': false},
    {'icon': Icons.music_note, 'label': 'DJ', 'isSelected': false},
    {'icon': Icons.event, 'label': 'Planner', 'isSelected': false},
    {'icon': Icons.security, 'label': 'Security', 'isSelected': false},
    {'icon': Icons.star, 'label': 'Host', 'isSelected': false},
    {'icon': Icons.cleaning_services, 'label': 'Clean-up', 'isSelected': false},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // Use it to prevent the GridView from expanding infinitely.
      physics: NeverScrollableScrollPhysics(), // To disable GridView's scrolling
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Adjust number of columns to fit your design
        childAspectRatio: 1, // Adjust child aspect ratio to fit your design
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return GestureDetector(
          onTap: () {
            setState(() {
              service['isSelected'] = !service['isSelected'];
              if (services[index]['isSelected']) {
            widget.updateSelectedServices(services[index]['label'], 120, services[index]['icon']); // Example price
          }
            });
          },
          child: Card(
            color: service['isSelected'] ? const Color.fromARGB(255, 159, 159, 159) : Colors.grey[800],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(service['icon'], color: Colors.white),
                Text(
                  service['label'],
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ServiceEstimateCard extends StatelessWidget {
  final String service;
  final IconData iconServ;
  final int count;
  final double price;
  final VoidCallback onAdd;
  final VoidCallback onSubtract;
  final VoidCallback onRemoveCard; // Callback to remove the card

  const ServiceEstimateCard({
    Key? key,
    required this.service,
    required this.iconServ,
    required this.count,
    required this.price,
    required this.onAdd,
    required this.onSubtract,
    required this.onRemoveCard, // Added parameter for removing the card
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(iconServ, color: Colors.white), // Replace with appropriate icon
            SizedBox(width: 8),
            Expanded(
              child: Text(
                service,
                style: TextStyle(color: Colors.white),
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: onRemoveCard,
            ),
            IconButton(
              icon: Icon(Icons.remove, color: Colors.white),
              onPressed: onSubtract,
            ),
            Text(
              '$count',
              style: TextStyle(color: Colors.white),
            ),
            IconButton(
              icon: Icon(Icons.add, color: Colors.white),
              onPressed: onAdd,
            ),
            Text(
              '\$$price',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}


class HomeClientScreen extends StatefulWidget {
  @override
  _HomeClientScreenState createState() => _HomeClientScreenState();
}

class _HomeClientScreenState extends State<HomeClientScreen> {
  int numberOfBartenders = 1;
  double pricePerBartender = 120;
  String selectedPartyType = 'House';
  List<Map<String, dynamic>> selectedServices = [];

  void updateSelectedServices(String service, double price, IconData iconDisp) {
  // Here you would add logic to update the selectedServices list based on user actions
  setState(() {
    selectedServices.add({
      'service': service,
      'icon': iconDisp,
      'count': 1,
      'price': price,
    });
  });
}

  void removeService(String serviceLabel) {
    print(serviceLabel);
    setState(() {
      selectedServices.removeWhere((service) => service['service'] == serviceLabel);
    });
    print(selectedServices);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.black,
        centerTitle: true,
        // Add other AppBar properties as needed
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 70.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Party Type',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Choose the setting for your celebration',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(height: 10),
              Container(
              height: 100, // Adjust the height to fit your design
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  PartyTypeCard(
                    icon: Icons.house,
                    label: 'House',
                    isSelected: selectedPartyType == 'House',
                    onSelect: () {
                      setState(() {
                        selectedPartyType = 'House';
                      });
                    },
                  ),
                  PartyTypeCard(
                    icon: Icons.favorite,
                    label: 'Wedding',
                    isSelected: selectedPartyType == 'Wedding',
                    onSelect: () {
                      setState(() {
                        selectedPartyType = 'Wedding';
                      });
                    },
                  ),
                  PartyTypeCard(
                    icon: Icons.business,
                    label: 'Corporate',
                    isSelected: selectedPartyType == 'Corporate',
                    onSelect: () {
                      setState(() {
                        selectedPartyType = 'Corporate';
                      });
                    },
                  ),
                  PartyTypeCard(
                    icon: Icons.business,
                    label: 'Corporate',
                    isSelected: selectedPartyType == 'Corporate',
                    onSelect: () {
                      setState(() {
                        selectedPartyType = 'Corporate';
                      });
                    },
                  ),
                  PartyTypeCard(
                    icon: Icons.business,
                    label: 'Corporate',
                    isSelected: selectedPartyType == 'Corporate',
                    onSelect: () {
                      setState(() {
                        selectedPartyType = 'Corporate';
                      });
                    },
                  ),
                  // Add more PartyTypeCards as needed
                ],
              ),
            ),
              SizedBox(height: 24),
              Text(
                'Services',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Select from a range of professionals',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(height: 10),
              ServicesGrid(updateSelectedServices: updateSelectedServices,),
              // ... Add your service selection grid ...
              SizedBox(height: 24),
              Text(
                'Estimate',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Review and manage the cost of your selected services',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...selectedServices.map((service) {
                    return ServiceEstimateCard(
                      service: service['service'],
                      iconServ: service['icon'],
                      count: service['count'],
                      price: service['price'],
                      onAdd: () {
                        // Logic to increment service count
                      },
                      onSubtract: () {
                        // Logic to decrement service count
                      },
                      onRemoveCard: () {
                        removeService(service['service']);
                      },
                    );
                  }).toList(),
                ],
              ),
            ],
          ),
        ),
      ),
      Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start, // Aligns children at start and end
          children: [
            Expanded(
              child: Container(
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
                          Navigator.pushNamed(context, '/homeClient');
                        },
                        child: Text(
                          'Accept',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
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
                    ),), // Takes all available space, pushing the button to the bottom
            
          ],
      ),
      ],
      ), 
      
    );
  }
}
