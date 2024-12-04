import 'package:flutter/material.dart';

class AddWorkoutClassPage extends StatefulWidget {
  @override
  _AddWorkoutClassPageState createState() => _AddWorkoutClassPageState();
}

class _AddWorkoutClassPageState extends State<AddWorkoutClassPage> {
  String? selectedSportClass;
  String? selectedSchedule;
  String? selectedCoach;
  String? selectedEquipment;

  void handleConfirm() {
    // Validate inputs
    if (selectedSportClass == null || 
        selectedSchedule == null || 
        selectedCoach == null || 
        selectedEquipment == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Workout class added successfully')),
    );
    
    // Navigate back
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F1D2B),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Add Workout Class',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Class Name :',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            _buildDropdownButton(
              value: selectedSportClass,
              hint: 'Choose Sport Class',
              items: ['Zumba', 'Yoga', 'Pilates', 'Boxing'],
              onChanged: (String? value) {
                setState(() => selectedSportClass = value);
              },
            ),
            SizedBox(height: 24),

            Text(
              'Schedule :',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            _buildDropdownButton(
              value: selectedSchedule,
              hint: 'Choose Schedule',
              items: ['Morning', 'Afternoon', 'Evening'],
              onChanged: (String? value) {
                setState(() => selectedSchedule = value);
              },
            ),
            SizedBox(height: 24),

            Text(
              'Instructor / Coach :',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            _buildDropdownButton(
              value: selectedCoach,
              hint: 'Choose Coach (Personal Trainer)',
              items: ['John Doe', 'Jane Smith', 'Mike Johnson'],
              onChanged: (String? value) {
                setState(() => selectedCoach = value);
              },
            ),
            SizedBox(height: 24),

            Text(
              'Equipment (Select \'empty\', if not using) :',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            _buildDropdownButton(
              value: selectedEquipment,
              hint: 'Choose Equipment',
              items: ['empty', 'Dumbbells', 'Yoga Mat', 'Boxing Gloves'],
              onChanged: (String? value) {
                setState(() => selectedEquipment = value);
              },
            ),
            
            Spacer(),
            
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: handleConfirm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF4B4B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownButton({
    required String? value,
    required String hint,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: value,
        hint: Text(hint),
        isExpanded: true,
        underline: SizedBox(),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}