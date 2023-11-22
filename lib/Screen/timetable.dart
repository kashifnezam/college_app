import 'package:college_app/Screen/Time%20Table/tab_a.dart';
import 'package:college_app/Screen/Time%20Table/tab_b.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  int currIndex = 0;
  int day = DateTime.now().weekday;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Time Table",
          style: GoogleFonts.abel(
              fontWeight: FontWeight.bold,
              textStyle: const TextStyle(letterSpacing: 1)),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currIndex = value;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currIndex,
        backgroundColor: Colors.deepPurple.shade50,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Text("Section A",
                style: currIndex == 0
                    ? GoogleFonts.abel(
                        fontWeight: FontWeight.bold, fontSize: 17)
                    : GoogleFonts.abel(
                        color: Colors.grey,
                      )),
            label: "",
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Text("Section B",
                style: currIndex == 1
                    ? GoogleFonts.abel(
                        fontWeight: FontWeight.bold, fontSize: 17)
                    : GoogleFonts.abel(
                        color: Colors.grey,
                      )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: currIndex == 0 ? const TabA() : const TabB(),
      ),
    );
  }
}
