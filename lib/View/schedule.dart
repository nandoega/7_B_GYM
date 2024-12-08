import 'package:flutter/material.dart';
import 'package:pbp/View/edit_schedule.dart'; // Import the edit page

class SchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(40, 42, 65, 100),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(40, 42, 65, 100),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Schedule',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            // Search bar
            TextField(
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: 'Look for schedule here...',
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.search, color: Colors.black),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Schedule Card
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(57, 81, 189, 100),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '1 - Monday 1.1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate to Edit schedule page when pencil icon is tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditSchedulePage()),
                          );
                        },
                        child: Icon(Icons.edit, color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          // Show delete confirmation modal
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Delete Schedule'),
                                content: Text(
                                    'Are you sure you want to delete this schedule?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the modal
                                    },
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // Add delete functionality here
                                      Navigator.of(context)
                                          .pop(); // Close the modal
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(content: Text('Schedule deleted')),
                                      );
                                    },
                                    child: Text('Delete',
                                        style: TextStyle(color: Colors.red)),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            // Add New Schedule Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Add new schedule functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Add new schedule',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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