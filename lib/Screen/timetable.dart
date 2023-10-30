import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeTable extends StatelessWidget {
  const TimeTable({super.key});

  @override
  Widget build(BuildContext context) {
    List week = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
    ];
    List<List> subj = [
      ["MT", "eCD/CSDL", "DAA", "MT LAB", "MT LAB", "AI-ML", "MP-III"],
      ["MT", "eCD/CSDL", "DAA", "SPM", "AI-ML LAB", "AI-ML LAB", "AI-ML"],
      ["SPM", "eCD/CSDL", "NUES", "DAA LAB", "DAA LAB", "MP-III", "MP-III"],
      ["NUES", "SPM LAB", "SPM LAB", "DAA", "AI-ML", "SPM", "MP-III"],
      ["MT", "eCD/CSDL", "AI-ML", "SPM", "LIB", "DAA", "MP-III"],
    ];
    Map<String, String> teacher = {
      "DAA": "MK/RM",
      "DAA LAB": "MK/RM",
      "eCD/CSDL": "PK/MP",
      "AI-ML": "KS",
      "AI-ML LAB": "KS",
      "SPM": "RV",
      "SPM LAB": "VA",
      "MP-III": "--",
      "MT": "KaS",
      "MT LAB": "KaS",
      "NUES": "--",
      "LIB": "--"
    };
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
      body: SingleChildScrollView(
          child: Column(
        children: [
          for (int i = 0; i < week.length; i++)
            dailyRoutine(week[i], subj[i], teacher),
        ],
      )),
    );
  }

  Widget singleRoutine(
      {String dp = "",
      required String sub,
      required String teacher,
      required String timeSlot}) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: Colors.deepPurple,
          child: dp == ""
              ? const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                )
              : Image.asset(dp)),
      title: Text(
        sub,
        style: GoogleFonts.alegreya(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(teacher),
      trailing: Text(
        timeSlot,
        style: GoogleFonts.nunito(
          fontSize: 14,
          letterSpacing: 1,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget dailyRoutine(String day, List sub, Map teacher) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
          child: Text(
            day,
            style:
                GoogleFonts.alegreya(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        singleRoutine(
            sub: sub[0],
            teacher: teacher[sub[0]],
            timeSlot: "9:30 AM - 10:30 AM"),
        const Divider(),
        singleRoutine(
            sub: sub[1],
            teacher: teacher[sub[1]],
            timeSlot: "10:30 AM - 11:30 AM"),
        Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple),
                color: Colors.deepPurple[50]),
            child: Text(
              "Break Time :  10 Mins",
              style: GoogleFonts.alegreyaSans(fontSize: 13),
            ),
          ),
        ),
        singleRoutine(
            sub: sub[2],
            teacher: teacher[sub[2]],
            timeSlot: "11:40 AM - 12:40 PM"),
        Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple),
                color: Colors.deepPurple[50]),
            child: Text(
              "Lunch Time :  1 Hour",
              style: GoogleFonts.alegreyaSans(fontSize: 13),
            ),
          ),
        ),
        singleRoutine(
            sub: sub[3],
            teacher: teacher[sub[3]],
            timeSlot: "01:40 PM - 02:40 PM"),
        const Divider(),
        singleRoutine(
            sub: sub[4],
            teacher: teacher[sub[4]],
            timeSlot: "02:40 PM - 03:40 PM"),
        const Divider(),
        singleRoutine(
            sub: sub[5],
            teacher: teacher[sub[5]],
            timeSlot: "03:40 PM - 04:40 PM"),
        const Divider(),
        singleRoutine(
            sub: sub[6],
            teacher: teacher[sub[6]],
            timeSlot: "04:40 PM - 05:40 PM"),
      ],
    );
  }
}
