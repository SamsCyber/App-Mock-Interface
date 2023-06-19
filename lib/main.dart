import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Greenhouse',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green[900],)
      ),
      home: MyGreenhouse(),
    );
  }
}

class MyGreenhouse extends StatefulWidget {
  @override
  _MyGreenhouseState createState() => _MyGreenhouseState();
}

class _MyGreenhouseState extends State<MyGreenhouse> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [
    PlantScreen(),
    SensorThresholdsPage(),
    CCTVPage(),
    NotificationPage(),
  ];

  void _onItemTapped(int index) {
    if (index >= 0 && index < _widgetOptions.length) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Greenhouse'),
        leading:
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Add your settings navigation here
            },
          ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_florist),
            label: 'Plants',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tune),
            label: 'Sensor Thresholds',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            label: 'CCTV',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.mail),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: Text(
                      '5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            label: 'Notifications',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}

class PlantDetails extends StatelessWidget {
  final int plantIndex;

  PlantDetails({required this.plantIndex});

  Widget _generatePlantHealthIcons() {
    List<Color> plantHealthColors;

    if (plantIndex % 3 == 0) {
      plantHealthColors = [Colors.red, Colors.grey, Colors.grey];
    } else if (plantIndex % 3 == 1) {
      plantHealthColors = [Colors.yellow, Colors.yellow, Colors.grey];
    } else {
      plantHealthColors = [Colors.green, Colors.green, Colors.green];
    }

    return Row(
      children: [
        for (Color color in plantHealthColors)
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Icon(
              Icons.circle,
              color: color,
              size: 16,
            ),
          ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant $plantIndex Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Last time the soil was irrigated:'),
            Text('HH:MM hours ago'),
            SizedBox(height: 20),
            Text('Last time hydroponic solution was added:'),
            Text('HH:MM hours ago'),
            SizedBox(height: 20),
            Text('Current moisture levels:'),
            Text('XX%'),
            SizedBox(height: 20),
            Text('Current nutrient levels:'),
            Text('YY%'),
            SizedBox(height: 20),
            Text('Graph placeholder:'),
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey.shade300,
              child: Center(child: Text('Graph placeholder')),
            ),
            SizedBox(height:20),
            Text('Plant Health and Progression rating based on history of feeding and irrigation levels'),
            _generatePlantHealthIcons(),
          ],
        ),
      ),
    );
  }
}

class PlantScreen extends StatelessWidget {

  // Helper function to generate the plant health icons
  Widget _generatePlantHealthIcons(int index) {
    List<Color> plantHealthColors;

    if (index % 3 == 0) {
      plantHealthColors = [Colors.red, Colors.grey, Colors.grey];
    } else if (index % 3 == 1) {
      plantHealthColors = [Colors.yellow, Colors.yellow, Colors.grey];
    } else {
      plantHealthColors = [Colors.green, Colors.green, Colors.green];
    }

    return Row(
      children: [
        for (Color color in plantHealthColors)
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Icon(
              Icons.circle,
              color: color,
              size: 16,
            ),
          ),
      ],
    );
  }

  Widget _buildSubAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 4.0),
      color: Colors.green[500],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(text: 'Lighting management system: '),
                      TextSpan(text: 'enabled', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(text: 'Irrigation/nutrition management system: '),
                      TextSpan(text: 'enabled', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(text: 'Temperature management system: '),
                      TextSpan(text: 'enabled', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16), // Add some space between the two sets of items
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(text: 'Current temp: '),
                      TextSpan(text: 'XX°C', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(text: 'Shutter/shade system: '),
                      TextSpan(text: 'active', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(text: 'Dehumidifier: '),
                      TextSpan(text: 'inactive', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(text: 'Artificial lighting: '),
                      TextSpan(text: 'active', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSubAppBar(context),
        Expanded(child:   GridView.count(
          crossAxisCount: 4,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          padding: EdgeInsets.all(10.0),
          children: List.generate(16, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlantDetails(plantIndex: index),
                  ),
                );
              },
              child: Card(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Icon(
                            FontAwesomeIcons.seedling,
                            size: 40,
                            color: Colors.green[900],
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Text(
                            'Plant $index',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Last watered:',
                          style: TextStyle(fontSize: 12),
                        ),
                        Row(
                          children: [
                            Icon(
                              MdiIcons.water,
                              size: 16,
                              color: Colors.blue,
                            ),
                            Text(
                              ' HH hours MM minutes ago',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Length of time in greenhouse:',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          ' XX days',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Plant health and progression:',
                          style: TextStyle(fontSize: 12),
                        ),
                        _generatePlantHealthIcons(index),
                      ],
                    )
                ),
              ),
            );
          }),
        ),
        ),
      ],
    );

  }
}

class SensorThresholdsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        _buildLightingManagementSystem(context),
        _buildIrrigationNutritionManagementSystem(context),
        _buildTemperatureManagementSystem(context),
      ],
    );
  }

  Widget _buildLightingManagementSystem(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lighting Management System',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Recommended artificial lighting threshold: XX lux'),
            Text('Current threshold: XX lux'),
            TextField(
              decoration: InputDecoration(labelText: 'Enter new threshold'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement logic to change threshold here
              },
              child: Text('Change threshold'),
            ),
            Text('Artificial lighting: active'),
            ElevatedButton(
              onPressed: () {
                // Implement logic to activate/deactivate shutters here
              },
              child: Text('Activate/Deactivate artificial lighting'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIrrigationNutritionManagementSystem(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    // Implement logic to navigate to the previous plant
                  },
                ),
                Text(
                  'Irrigation/Nutrition Management System for plant 0',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    // Implement logic to navigate to the next plant
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
            Text('Recommended moisture threshold: XX'),
            Text('Current moisture threshold: XX'),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Enter new moisture threshold'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement logic to change moisture threshold here
              },
              child: Text('Change threshold'),
            ),
            SizedBox(height: 8),
            Text('Recommended nutrient threshold: XX'),
            Text('Current nutrient threshold: XX'),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Enter new nutrient threshold'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement logic to change nutrient threshold here
              },
              child: Text('Change threshold'),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Implement logic to water plant manually here
              },
              child: Text('Water manually now'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement logic to feed nutrients manually here
              },
              child: Text('Feed nutrients manually now'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTemperatureManagementSystem(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Temperature Management System',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
                'Recommended Upper/Lower temperature thresholds to activate/deactivate shutters: XX degrees, XX degrees'),
            Text('Current thresholds: XX degrees, XX degrees'),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Enter new temperature thresholds'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement logic to change temperature thresholds here
              },
              child: Text('Change temp thresholds'),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Enter new humidity thresholds'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement logic to change temperature thresholds here
              },
              child: Text('Change humidity thresholds'),
            ),
            Text('Shutters/shades: active'),
            ElevatedButton(
              onPressed: () {
                // Implement logic to activate/deactivate shutters here
              },
              child: Text('Activate/Deactivate shutters manually'),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationPage extends StatelessWidget {
  final List<String> _notifications = [
    'The shutters have been activated as the greenhouse is too hot',
    'Plant 5, 6, 7, 8, and 9 have just been watered and fed hydroponic solution',
    'Artificial lighting has been turned off as sufficient sunlight is detected',
    'Temperature management system is active',
    'Plant 3 has reached optimal growth',
  ];

  Widget _buildNotificationItem(BuildContext context, int index) {
    return ListTile(
      leading: Icon(Icons.notifications),
      title: Text(_notifications[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _notifications.length,
      itemBuilder: _buildNotificationItem,
    );
  }
}


class CCTVPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'CCTV Feed Placeholder',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}