import 'package:field_2_fork/consts/consts.dart';
import 'package:flutter/material.dart';

class FarmerAccountScreen extends StatelessWidget {
  const FarmerAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'My Profile',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 80,
                    backgroundImage:
                        AssetImage("assets/images/profileBhanu.jpeg"),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'K.Bhanu Prakash Reddy',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'kbhanuprakashreddy143@gmail.com',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.update),
                  title: Text('Update ProfileInfo'),
                  subtitle: Text('Name & Image'),
                  onTap: () {
                    // Handle navigation to the Startup Name page.
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => StartupNamePage()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.business),
                  title: Text('Startup Name'),
                  subtitle: Text('My Startup Inc.'),
                  onTap: () {
                    // Handle navigation to the Startup Name page.
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => StartupNamePage()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Location'),
                  subtitle: Text('New York, USA'),
                  onTap: () {
                    // Handle navigation to the Location page.
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => LocationPage()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    // Handle navigation to the Settings page.
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Implement logout functionality.
              },
              child: Text('Sign Out'),
            ),
          ),
        ],
      ),
    );
  }
}
