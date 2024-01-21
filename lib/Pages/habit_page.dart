import 'package:flutter/material.dart';
import 'package:loginsignup/CommonAppBar.dart';
import 'package:loginsignup/CustomNavBar.dart';

class HabitPage extends StatefulWidget {
  const HabitPage({Key? key}) : super(key: key);

  @override
  State<HabitPage> createState() => _HabitPageState();
}

class _HabitPageState extends State<HabitPage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Habit Page",
        automaticallyImplyLeading: true,
        alignTitleLeft: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Displaying the days' names on top
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildDayName("Mon"),
                _buildDayName("Tue"),
                _buildDayName("Wed"),
                _buildDayName("Thu"),
                _buildDayName("Fri"),
                _buildDayName("Sat"),
                _buildDayName("Sun"),
              ],
            ),
            SizedBox(height: 8.0),
            // Wrap the GridView.builder with a Container for margin
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
                itemCount: 35, // Displaying 5 weeks (5x7)
                itemBuilder: (context, index) {
                  final dayNumber = index - DateTime.utc(2024, 1, 1).weekday + 2;
                  if (dayNumber <= 0 || dayNumber > 31) {
                    return Container(); // Placeholder for days outside January
                  }
                  return _buildDayTile(dayNumber);
                },
              ),
            ),
            SizedBox(height: 16.0), // Add some space between the calendar and the new section
            // New Section with Image
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey, // Set the background color
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.all(140.0),
              child: Center(
                child: Text(
                  'Streak will be shown here ',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 1) {
            return;
          } else {
            Navigator.pop(context);
          }
        },
      ),
    );
  }

  Widget _buildDayTile(int dayNumber) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.teal, // Customize the tile color
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dayNumber.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white, // Customize the text color
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayName(String dayName) {
    return Container(
      padding: EdgeInsets.all(8.0),
      color: Colors.grey[400], // Customize the background color
      child: Text(
        dayName,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black87, // Customize the text color
        ),
      ),
    );
  }
}
