import 'package:college_app/Screen/courses.dart';
import 'package:college_app/Screen/navbar.dart';
import 'package:college_app/Screen/timetable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> subject = [
      {
        "name": "Design & Analysis of Algorithms",
        "syllabus": "assets/pdf/DAA.pdf"
      },
      {"name": "Software Project Management", "syllabus": "assets/pdf/SPM.pdf"},
      {"name": "Multimedia Technologies", "syllabus": "assets/pdf/mt.pdf"},
      {"name": "e-Content Development", "syllabus": "assets/pdf/eContent.pdf"},
      {
        "name": "Cyber Security & Cyber Laws",
        "syllabus": "assets/pdf/cyber.pdf"
      },
      {"name": "Artificial Intelligence", "syllabus": "assets/pdf/ai.pdf"},
    ];
    return Scaffold(
      drawer: const Navbar(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "MCA (Semester 3)",
          style: GoogleFonts.abel(
              fontWeight: FontWeight.bold,
              textStyle: const TextStyle(letterSpacing: 1)),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          // TabBar(
          //     labelColor: Colors.deepPurple,
          //     unselectedLabelColor: Colors.grey,
          //     indicatorColor: Colors.deepPurple,
          //     automaticIndicatorColorAdjustment: true,
          //     controller: controller,
          //     tabs: const [
          //       Tab(
          //         text: "Section A",
          //       ),
          //       Tab(
          //         text: "Section B",
          //       ),
          //     ]),
          // Container(
          //   margin: const EdgeInsets.all(20),
          //   width: double.maxFinite,
          //   height: 200,
          //   child: TabBarView(controller: controller, children: [
          //     Tab(
          //       child: InteractiveViewer(
          //         maxScale: 5.0,
          //         minScale: 0.1,
          //         child: Image.asset(
          //           height: 200,
          //           fit: BoxFit.fill,
          //           "assets/images/mca_3A.png",
          //         ),
          //       ),
          //     ),
          //     Tab(
          //       child: InteractiveViewer(
          //         maxScale: 5.0,
          //         minScale: 0.1,
          //         child: Image.asset(
          //           height: 200,
          //           fit: BoxFit.fill,
          //           "assets/images/mca_3B.png",
          //         ),
          //       ),
          //     ),
          //   ]),
          // ),
          // const Divider(thickness: 0.9),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "All Subjects",
              style: GoogleFonts.alegreyaSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  decoration: TextDecoration.underline,
                  color: Colors.deepPurple[800]),
            ),
          ),
          Card(
            color: Colors.deepPurple[50],
            margin: const EdgeInsets.all(20),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: subject.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(
                    subject[index]["name"],
                  ),
                  trailing: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.deepPurple[500])),
                    onPressed: () {
                      Get.to(() => const Courses(), arguments: [
                        subject[index]["syllabus"],
                        subject[index]["name"]
                      ]);
                    },
                    child: const Text("Click Here"),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // const Text("You are now an Admin"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.deepPurple[800])),
              onPressed: () {
                Get.to(
                  () => const TimeTable(),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  "Time Table",
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
