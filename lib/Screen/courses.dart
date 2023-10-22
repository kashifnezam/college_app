import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_app/Screen/topics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';

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
          bottom: const TabBar(
            indicatorColor: Colors.transparent,
            labelPadding: EdgeInsets.all(10),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Text(
                "Topics",
              ),
              Text(
                "Assignments",
              ),
              Text(
                "Syllabus",
              ),
            ],
          ),
          title: Text(Get.arguments[1]),
        ),
        body:
            // -------------------------1st page----------------------------------
            TabBarView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("MCA")
                  .where("subject", isEqualTo: Get.arguments[1])
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
          const Center(
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
          ),
          // 3rd Page-----------------
          Scaffold(
            body: const PDF().fromAsset(
              Get.arguments[0],
              loadingWidget: () => const CircularProgressIndicator(),

              // placeholder: (progress) => Center(child: Text('$progress %')),
              errorWidget: (error) => Center(child: Text(error.toString())),
            ),
          )
        ]),
      ),
    );
  }
}
