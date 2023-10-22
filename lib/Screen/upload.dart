import 'dart:io';

import 'package:college_app/services/auth.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  TextEditingController linkController = TextEditingController();
  TextEditingController topicController = TextEditingController();
  bool isButton = false;
  bool isloading = false;
  bool isFile = false;
  bool isC = false;
  bool isSem = false;
  bool isSub = false;
  late List files;

  List questions = [
    "Course",
    "Semester",
    "Subject",
  ];
  List cOptions = [
    "MCA",
    "MBA",
  ];
  List semOptions = [
    "I",
    "II",
    "III",
    "IV",
  ];
  List subOptions = [
    "Design & Analysis of Algorithms",
    "Software Project Management",
    "Multimedia Technologies",
    "e-Content Development",
    "Cyber Security & Cyber Laws",
    "Artificial Intelligence"
  ];
  String cValue = "";
  String semValue = "";
  String subValue = "";
  String fileNamePDF = "";
  late File filePDF;

  @override
  Widget build(BuildContext context) {
    void pickFilePDF() async {
      final pickedFile = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ["pdf"],
      );

      if (pickedFile != null) {
        fileNamePDF = pickedFile.files[0].name;
        files = pickedFile.files;
        filePDF = File(pickedFile.files[0].path!);
        setState(() {
          isFile = true;
          isButton = isC & isSem & isSub & isFile;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Fill Details Carefully",
          style: GoogleFonts.alegreyaSans(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView(
          children: [
            //---------------- Options for Q1-------------------
            Center(
              child: Text(
                questions[0],
                style: GoogleFonts.alegreya(fontSize: 32),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      cValue = cOptions[0];
                      isC = true;
                      isButton = isC & isSem & isSub & isFile;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: Colors.deepPurple.shade100),
                    child: Row(
                      children: [
                        Radio(
                          value: cOptions[0],
                          groupValue: cValue,
                          activeColor: Colors.black,
                          onChanged: ((value) {
                            setState(() {
                              cValue = value.toString();
                              isC = true;
                              isButton = isC & isSem & isSub & isFile;
                            });
                          }),
                        ),
                        Text(
                          cOptions[0],
                          style: GoogleFonts.alegreya(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      cValue = cOptions[1];
                      isC = true;
                      isButton = isC & isSem & isSub & isFile;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: Colors.deepPurple.shade100),
                    child: Row(
                      children: [
                        Radio(
                          value: cOptions[1],
                          groupValue: cValue,
                          activeColor: Colors.black,
                          onChanged: ((value) {
                            setState(() {
                              cValue = value.toString();
                              isC = true;
                              isButton = isC & isSem & isSub & isFile;
                            });
                          }),
                        ),
                        Text(
                          cOptions[1],
                          style: GoogleFonts.alegreya(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            //
            const Divider(thickness: 1),
            // -----------Next Question2-------------

            Center(
              child: Text(
                questions[1],
                style: GoogleFonts.alegreya(fontSize: 32),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      semValue = semOptions[0];
                      isSem = true;
                      isButton = isC & isSem & isSub & isFile;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: Colors.deepPurple.shade100),
                    child: Row(
                      children: [
                        Radio(
                          value: semOptions[0],
                          groupValue: semValue,
                          activeColor: Colors.black,
                          onChanged: ((value) {
                            setState(() {
                              semValue = value.toString();
                              isSem = true;
                              isButton = isC & isSem & isSub & isFile;
                            });
                          }),
                        ),
                        Text(
                          semOptions[0],
                          style: GoogleFonts.alegreya(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      semValue = semOptions[1];
                      isSem = true;
                      isButton = isC & isSem & isSub & isFile;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: Colors.deepPurple.shade100),
                    child: Row(
                      children: [
                        Radio(
                          value: semOptions[1],
                          groupValue: semValue,
                          activeColor: Colors.black,
                          onChanged: ((value) {
                            setState(() {
                              semValue = value.toString();
                              isSem = true;
                              isButton = isC & isSem & isSub & isFile;
                            });
                          }),
                        ),
                        Text(
                          semOptions[1],
                          style: GoogleFonts.alegreya(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // -------- Next Row---------
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      semValue = semOptions[2];
                      isSem = true;
                      isButton = isC & isSem & isSub & isFile;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: Colors.deepPurple.shade100),
                    child: Row(
                      children: [
                        Radio(
                          value: semOptions[2],
                          groupValue: semValue,
                          activeColor: Colors.black,
                          onChanged: ((value) {
                            setState(() {
                              semValue = value.toString();
                              isSem = true;
                              isButton = isC & isSem & isSub & isFile;
                            });
                          }),
                        ),
                        Text(
                          semOptions[2],
                          style: GoogleFonts.alegreya(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      semValue = semOptions[3];
                      isSem = true;
                      isButton = isC & isSem & isSub & isFile;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: Colors.deepPurple.shade100),
                    child: Row(
                      children: [
                        Radio(
                          value: semOptions[3],
                          groupValue: semValue,
                          activeColor: Colors.black,
                          onChanged: ((value) {
                            setState(() {
                              semValue = value.toString();
                              isSem = true;
                              isButton = isC & isSem & isSub & isFile;
                            });
                          }),
                        ),
                        Text(
                          semOptions[3],
                          style: GoogleFonts.alegreya(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //
            const SizedBox(
              height: 10,
            ),

            const Divider(thickness: 1),

            // -----------Next Question3-------------

            Center(
              child: Text(
                questions[2],
                style: GoogleFonts.alegreya(fontSize: 32),
              ),
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  subValue = subOptions[0];
                  isSub = true;
                  isButton = isC & isSem & isSub & isFile;
                });
              },
              child: Container(
                padding: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.deepPurple.shade100),
                child: Row(
                  children: [
                    Radio(
                      value: subOptions[0],
                      groupValue: subValue,
                      activeColor: Colors.black,
                      onChanged: ((value) {
                        setState(() {
                          subValue = value.toString();
                          isSub = true;
                          isButton = isC & isSem & isSub & isFile;
                        });
                      }),
                    ),
                    Text(
                      subOptions[0],
                      style: GoogleFonts.alegreya(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  subValue = subOptions[1];
                  isSub = true;
                  isButton = isC & isSem & isSub & isFile;
                });
              },
              child: Container(
                padding: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.deepPurple.shade100),
                child: Row(
                  children: [
                    Radio(
                      value: subOptions[1],
                      groupValue: subValue,
                      activeColor: Colors.black,
                      onChanged: ((value) {
                        setState(() {
                          subValue = value.toString();
                          isSub = true;
                          isButton = isC & isSem & isSub & isFile;
                        });
                      }),
                    ),
                    Text(
                      subOptions[1],
                      style: GoogleFonts.alegreya(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  subValue = subOptions[2];
                  isSub = true;
                  isButton = isC & isSem & isSub & isFile;
                });
              },
              child: Container(
                padding: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.deepPurple.shade100),
                child: Row(
                  children: [
                    Radio(
                      value: subOptions[2],
                      groupValue: subValue,
                      activeColor: Colors.black,
                      onChanged: ((value) {
                        setState(() {
                          subValue = value.toString();
                          isSub = true;
                          isButton = isC & isSem & isSub & isFile;
                        });
                      }),
                    ),
                    Text(
                      subOptions[2],
                      style: GoogleFonts.alegreya(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            // -------- Next Row---------
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  subValue = subOptions[3];
                  isSub = true;
                  isButton = isC & isSem & isSub & isFile;
                });
              },
              child: Container(
                padding: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.deepPurple.shade100),
                child: Row(
                  children: [
                    Radio(
                      value: subOptions[3],
                      groupValue: subValue,
                      activeColor: Colors.black,
                      onChanged: ((value) {
                        setState(() {
                          subValue = value.toString();
                          isSub = true;
                          isButton = isC & isSem & isSub & isFile;
                        });
                      }),
                    ),
                    Text(
                      subOptions[3],
                      style: GoogleFonts.alegreya(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  subValue = subOptions[4];
                  isSub = true;
                  isButton = isC & isSem & isSub & isFile;
                });
              },
              child: Container(
                padding: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.deepPurple.shade100),
                child: Row(
                  children: [
                    Radio(
                      value: subOptions[4],
                      groupValue: subValue,
                      activeColor: Colors.black,
                      onChanged: ((value) {
                        setState(() {
                          subValue = value.toString();
                          isSub = true;
                          isButton = isC & isSem & isSub & isFile;
                        });
                      }),
                    ),
                    Text(
                      subOptions[4],
                      style: GoogleFonts.alegreya(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  subValue = subOptions[5];
                  isSub = true;
                  isButton = isC & isSem & isSub & isFile;
                });
              },
              child: Container(
                padding: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.deepPurple.shade100),
                child: Row(
                  children: [
                    Radio(
                      value: subOptions[5],
                      groupValue: subValue,
                      activeColor: Colors.black,
                      onChanged: ((value) {
                        setState(() {
                          subValue = value.toString();
                          isSub = true;
                          isButton = isC & isSem & isSub & isFile;
                        });
                      }),
                    ),
                    Text(
                      subOptions[5],
                      style: GoogleFonts.alegreya(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(thickness: 1),
            // --------Topic field------------
            const SizedBox(
              height: 20,
            ),

            !isFile
                ? SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.indigo[100])),
                      onPressed: () {
                        pickFilePDF();
                        debugPrint("Button : $isButton");
                        debugPrint("Course : $isC");
                        debugPrint("sem : $isSem");
                        debugPrint("sub : $isSub");
                        debugPrint("file : $isSub");
                      },
                      child: const Text(
                        "Choose PDF only",
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 2,
                          color: Colors.indigo,
                        ),
                      ),
                    ))
                : SizedBox(
                    height: files.length == 1
                        ? 50
                        : files.length == 2
                            ? 100
                            : 140,
                    child: ListView.builder(
                        addAutomaticKeepAlives: false,
                        itemCount: files.length,
                        itemBuilder: (context, index) {
                          return ElevatedButton(
                            onPressed: null,
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                Colors.indigo[50],
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    files[index].name,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 18, letterSpacing: 2),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isFile = false;
                                        filePDF.delete();
                                        isButton = isC & isSem & isSub & isFile;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.cancel,
                                      color: Colors.indigo,
                                    ))
                              ],
                            ),
                          );
                        }),
                  ),

            // ------------------Link Field----------------------------

            // -----------Button-------------

            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              child: !isButton
                  ? const ElevatedButton(
                      onPressed: null,
                      child: Text(
                        "Upload",
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 2,
                        ),
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        uploadData();
                        debugPrint(
                            "course: $cValue, \nsemester: $semValue, \nsubject: $subValue, \n${topicController.text.toString()}");
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Colors.indigo,
                        ),
                      ),
                      child: isloading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.deepPurple.shade200,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              "Upload",
                              style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 2,
                                  color: Colors.white),
                            ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  uploadData() async {
    setState(() {
      isloading = true;
    });
    if (FirebaseAuth.instance.currentUser != null) {
      for (int i = 0; i < files.length; i++) {
        await uploadtoFirebase(
            course: cValue,
            sem: semValue,
            sub: subValue,
            topic: topicController.text.toString(),
            link: linkController.text.toString(),
            fileName: files[i].name,
            filePDF: File(files[i].path!));
      }
    } else {
      Get.snackbar("Permission Declined", "Please LOGIN first");
    }
    formatData();
  }

  formatData() {
    setState(() {
      isloading = false;
      isFile = false;
      isButton = false;
    });
  }
}
