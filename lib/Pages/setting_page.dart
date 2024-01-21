import 'package:flutter/material.dart';
import 'package:loginsignup/CommonAppBar.dart';
import 'package:loginsignup/CustomNavBar.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  int _currentIndex = 4; // Set the index to 4 for the "Setting" tab
  String _selectedLanguage = 'English'; // Default language selection
  bool _isDarkModeEnabled = false; // Toggle state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Settings",
        automaticallyImplyLeading: true,
        alignTitleLeft: true,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage('assets/profile_image.jpg'),
              ),
              title: Text(
                'Devesh Kaushal',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'ID: deveshkaushal004@gmail.com',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          buildSettingItem('Account Info', Icons.person),
          buildLanguageDropdown(),
          buildDarkModeToggle(),
          buildSettingItem('Change Password', Icons.lock),
          buildSettingItem('Logout', Icons.exit_to_app),
          buildSettingItem('Content Preference', Icons.format_list_bulleted),
        ],
      ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 4) {
            // Do nothing if the tapped index is the current index (Setting tab)
            return;
          } else {
            Navigator.pop(context); // Pop the SettingPage off the stack
            // Handle navigation or other actions based on the selected index
            // For now, let's navigate back to the previous screen
          }
        },
      ),
    );
  }

  Widget buildSettingItem(String title, IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black), // Change icon color to black
        title: Text(
          title,
          style: TextStyle(fontSize: 18.0),
        ),
        onTap: () {
          // Handle item click
          print('Clicked on $title');
        },
      ),
    );
  }

  Widget buildLanguageDropdown() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Icon(Icons.language, color: Colors.black), // Change icon color to black
        title: Text(
          'Language',
          style: TextStyle(fontSize: 18.0),
        ),
        trailing: DropdownButton<String>(
          value: _selectedLanguage,
          items: ['English', 'Hindi'].map((String language) {
            return DropdownMenuItem<String>(
              value: language,
              child: Text(language),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedLanguage = newValue!;
              // Add logic to change the app's language based on the selected value
              print('Selected Language: $_selectedLanguage');
            });
          },
        ),
      ),
    );
  }

  Widget buildDarkModeToggle() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Icon(Icons.nightlight_round, color: Colors.black), // Change icon color to black
        title: Text(
          'Dark Mode',
          style: TextStyle(fontSize: 18.0),
        ),
        trailing: Switch(
          value: _isDarkModeEnabled,
          onChanged: (value) {
            // Handle dark mode toggle
            print('Dark mode toggled: $value');
            // Update the app's state accordingly
            setState(() {
              _isDarkModeEnabled = value;
              // You can apply dark mode theme here based on _isDarkModeEnabled
            });
          },
        ),
      ),
    );
  }
}
