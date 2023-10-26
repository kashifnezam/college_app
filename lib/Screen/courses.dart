import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_app/Screen/topics.dart';
import 'package:college_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.transparent,
            labelPadding: const EdgeInsets.all(10),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Text(
                "Topics",
                style: GoogleFonts.nunito(),
              ),
              Text(
                "Assignments",
                style: GoogleFonts.nunito(),
              ),
              Text(
                "Syllabus",
                style: GoogleFonts.nunito(),
              ),
            ],
          ),
          title: Text(
            Get.arguments[1],
            style: GoogleFonts.nunito(),
          ),
        ),
        body: TabBarView(children: [
          // -------------------------1st page----------------------------------
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("MCA")
                  .where(
                    "subject",
                    isEqualTo: Get.arguments[1],
                  )
                  .where("assignment", isEqualTo: false)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          "No Data Found",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurpleAccent),
                        ),
                        Text(
                            textAlign: TextAlign.center,
                            "Please tell admin to upload stuff You want\nkashifnezam123@gmail.com"),
                      ],
                    ),
                  );
                }
                if (snapshot.data != null) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      String link = snapshot.data!.docs[index]['URL'];
                      String topic =
                          snapshot.data!.docs[index]['name'].split(".")[0];

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        child: ListTile(
                          subtitle: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextButton.icon(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.purple[50]),
                              ),
                              onPressed: () => dialogueBox(),
                              label: Text(
                                "Play Video",
                                style: GoogleFonts.alegreyaSans(
                                    textStyle: const TextStyle(fontSize: 15),
                                    color: Colors.black54),
                              ),
                              icon: const Icon(
                                Icons.play_circle_filled_sharp,
                                color: Colors.purple,
                                size: 15,
                              ),
                            ),
                          ),
                          leading: const Icon(
                            Icons.picture_as_pdf_rounded,
                            color: Colors.purple,
                          ),
                          title: Text(
                            topic,
                            style: GoogleFonts.alegreya(
                                textStyle: const TextStyle(fontSize: 20)),
                          ),
                          trailing: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.deepPurple[500])),
                            onPressed: () {
                              Get.to(() => const Topics(),
                                  arguments: [topic, link]);
                            },
                            child: const Text("Read"),
                          ),
                        ),
                      );
                    },
                    itemCount: snapshot.data!.docs.length,
                  );
                }
                return const Text("went wrong");
              },
            ),
          ),

          // 2nd page----------
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("MCA")
                  .where(
                    "subject",
                    isEqualTo: Get.arguments[1],
                  )
                  .where("assignment", isEqualTo: true)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          "No Data Found",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurpleAccent),
                        ),
                        Text(
                            textAlign: TextAlign.center,
                            "Please tell admin to upload stuff You want\nkashifnezam123@gmail.com"),
                      ],
                    ),
                  );
                }
                if (snapshot.data != null) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      String link = snapshot.data!.docs[index]['URL'];
                      String topic =
                          snapshot.data!.docs[index]['name'].split(".")[0];

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        child: ListTile(
                          leading: const Icon(
                            Icons.picture_as_pdf_rounded,
                            color: Colors.purple,
                          ),
                          title: Text(topic),
                          subtitle: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextButton.icon(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.purple[50]),
                              ),
                              onPressed: () {},
                              label: Text(
                                "Solution",
                                style: GoogleFonts.alegreyaSans(
                                    textStyle: const TextStyle(fontSize: 15),
                                    color: Colors.black54),
                              ),
                              icon: const Icon(
                                Icons.question_answer,
                                color: Colors.purple,
                                size: 15,
                              ),
                            ),
                          ),
                          trailing: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.deepPurple[500])),
                            onPressed: () {
                              Get.to(() => const Topics(),
                                  arguments: [topic, link]);
                            },
                            child: const Text("Read"),
                          ),
                        ),
                      );
                    },
                    itemCount: snapshot.data!.docs.length,
                  );
                }
                return const Text("went wrong");
              },
            ),
          ),
          // 3rd Page-----------------
          Scaffold(
            body: SfPdfViewer.asset(
              Get.arguments[0],
            ),
          )
        ]),
      ),
    );
  }
}
