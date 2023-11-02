import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  int chosenDay = 0;
  bool isSelected = false;
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
          // for (int i = 0; i < week.length; i++)
          //   dailyRoutine(week[i], subj[i], teacher),
          Container(
            margin: const EdgeInsets.all(8),
            width: 160,
            decoration: BoxDecoration(color: Colors.blueGrey[50]),
            child: Card(
              child: Column(
                children: [
                  if (isSelected || chosenDay == 0)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          chosenDay = 0;
                          isSelected = !isSelected;
                        });
                      },
                      child: ElevatedButton(
                        onPressed: (chosenDay == 0)
                            ? () {
                                setState(() {
                                  isSelected = !isSelected;
                                });
                              }
                            : null,
                        child: Text(
                          week[0],
                          style: GoogleFonts.alegreya(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  if (isSelected || chosenDay == 1)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          chosenDay = 1;
                          isSelected = !isSelected;
                        });
                      },
                      child: ElevatedButton(
                        onPressed: (chosenDay == 1)
                            ? () {
                                setState(() {
                                  isSelected = !isSelected;
                                });
                              }
                            : null,
                        child: Text(
                          week[1],
                          style: GoogleFonts.alegreya(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  if (isSelected || chosenDay == 2)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          chosenDay = 2;
                          isSelected = !isSelected;
                        });
                      },
                      child: ElevatedButton(
                        onPressed: (chosenDay == 2)
                            ? () {
                                setState(() {
                                  isSelected = !isSelected;
                                });
                              }
                            : null,
                        child: Text(
                          week[2],
                          style: GoogleFonts.alegreya(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  if (isSelected || chosenDay == 3)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          chosenDay = 3;
                          isSelected = !isSelected;
                        });
                      },
                      child: ElevatedButton(
                        onPressed: (chosenDay == 3)
                            ? () {
                                setState(() {
                                  isSelected = !isSelected;
                                });
                              }
                            : null,
                        child: Text(
                          week[3],
                          style: GoogleFonts.alegreya(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  if (isSelected || chosenDay == 4)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          chosenDay = 4;
                          isSelected = !isSelected;
                        });
                      },
                      child: ElevatedButton(
                        onPressed: (chosenDay == 4)
                            ? () {
                                setState(() {
                                  isSelected = !isSelected;
                                });
                              }
                            : null,
                        child: Text(
                          week[4],
                          style: GoogleFonts.alegreya(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),

          dailyRoutine(subj[chosenDay], teacher),
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

  Widget dailyRoutine(sub, Map teacher) {
    return Column(
      children: [
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
