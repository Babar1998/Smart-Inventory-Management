import 'package:flutter/material.dart';
import 'package:simsfyp/venddashboard.dart';

class VendorSettingsPage extends StatefulWidget {
  @override
  _VendorSettingsPageState createState() => _VendorSettingsPageState();
}

class _VendorSettingsPageState extends State<VendorSettingsPage> {
  bool _notificationEnabled = false;

  void _toggleNotification(bool value) {
    setState(() {
      _notificationEnabled = value;
    });
  }

  void _saveSettings() {
    // Implement your save settings logic here
    // For simplicity, we'll just print the current settings
    print('Notification Enabled: $_notificationEnabled');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const vendordashboard()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text('Settings'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notification',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: Text('Enable Notification'),
              value: _notificationEnabled,
              onChanged: _toggleNotification,
            ),
            SizedBox(height: 24.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => vendordashboard()));
                  _saveSettings;
                },
                child: Text('Save Settings'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
