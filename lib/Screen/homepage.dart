import 'package:college_app/Screen/courses.dart';
import 'package:college_app/Screen/login.dart';
import 'package:college_app/Screen/upload.dart';
import 'package:college_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    bool isActive = FirebaseAuth.instance.currentUser != null;
    // double sHeight = Get.height;
    // double sWidth = Get.width;
    TabController controller = TabController(length: 2, vsync: this);
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
      appBar: AppBar(
        leading: isActive
            ? IconButton(
                icon: const Icon(
                  Icons.logout_rounded,
                ),
                onPressed: () async {
                  await signOutGoogle();
                  setState(() {});
                },
              )
            : IconButton(
                icon: const Icon(Icons.person_4_outlined),
                onPressed: () {
                  Get.to(() => const LoginGoogle());
                },
              ),
        centerTitle: true,
        title: const Text("MCA (Semester 3)"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.indigoAccent,
                automaticIndicatorColorAdjustment: true,
                controller: controller,
                tabs: const [
                  Tab(
                    text: "Section A",
                  ),
                  Tab(
                    text: "Section B",
                  ),
                ]),
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 200,
              child: TabBarView(controller: controller, children: [
                Tab(
                  child: InteractiveViewer(
                    maxScale: 5.0,
                    minScale: 0.1,
                    child: Image.asset(
                      height: 200,
                      fit: BoxFit.fill,
                      "assets/images/mca_3A.png",
                    ),
                  ),
                ),
                Tab(
                  child: InteractiveViewer(
                    maxScale: 5.0,
                    minScale: 0.1,
                    child: Image.asset(
                      height: 200,
                      fit: BoxFit.fill,
                      "assets/images/mca_3B.png",
                    ),
                  ),
                ),
              ]),
            ),
            Card(
              color: Colors.deepPurple[50],
              margin: const EdgeInsets.all(20),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: subject.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(
                      subject[index]["name"],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
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
            const Text("You are now an Admin"),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.deepPurple[800])),
              onPressed: () {
                Get.to(() => const Upload());
              },
              child: const Text(
                "Add Data",
                style: TextStyle(fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
