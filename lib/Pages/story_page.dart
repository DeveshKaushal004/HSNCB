import 'package:flutter/material.dart';
import 'package:loginsignup/CommonAppBar.dart';
import 'package:loginsignup/CustomNavBar.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int _currentIndex = 3;

  // List of stories (you can move this to a separate data file or class)
  final List<Map<String, dynamic>> stories = [
    {
      'title': 'Inspiring Story of Overcoming Challenges 1',
      'imageURL': 'https://example.com/inspiring_image1.jpg',
      'content': 'Once upon a time... Story 1 content...',
    },
    {
      'title': 'Inspiring Story of Overcoming Challenges 2',
      'imageURL': 'https://example.com/inspiring_image2.jpg',
      'content': 'Once upon a time... Story 2 content...',
    },
    {
      'title': 'Inspiring Story of Overcoming Challenges 3',
      'imageURL': 'https://example.com/inspiring_image3.jpg',
      'content': 'Once upon a time... Story 3 content...',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Story Page",
        automaticallyImplyLeading: true,
        alignTitleLeft: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: stories.map((story) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.amberAccent, width: 2.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        story['title'],
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        height: 200.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            'Image will be displayed over here',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Once upon a time...',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        story['content'],
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          // Add any action or navigation as needed
                          // Example: Navigator.pushNamed(context, '/story-details');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amberAccent, // Change the button color to AmberAccent
                        ),
                        child: Text('Read Full Story',
                            style: TextStyle(color: Colors.black87)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
              ],
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 3) {
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
}
