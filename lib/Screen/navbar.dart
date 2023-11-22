import 'package:college_app/Screen/login.dart';
import 'package:college_app/Screen/timetable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/auth.dart';
import 'upload.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    String email = "Noida, Sector 62";
    String pic = "";
    String name = "C-DAC";
    bool currUser = FirebaseAuth.instance.currentUser != null;
    if (currUser) {
      email = FirebaseAuth.instance.currentUser!.email.toString();
      pic = FirebaseAuth.instance.currentUser!.photoURL.toString();
      name = FirebaseAuth.instance.currentUser!.displayName.toString();
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              name,
              style: GoogleFonts.nunitoSans(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              email,
              style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
            ),
            currentAccountPicture: currUser
                ? CircleAvatar(
                    child: ClipOval(
                      child: Image.network(
                        pic,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : null,
            decoration: BoxDecoration(
                image: DecorationImage(
                    opacity: 0.7,
                    image: currUser
                        ? const AssetImage(
                            "assets/images/cdac.jpeg",
                          )
                        : const AssetImage(
                            "assets/images/cdacCollege.png",
                          ),
                    fit: BoxFit.cover)),
          ),
          navbarItems("Time Table", const Icon(Icons.work), () {
            Get.to(() => const TimeTable());
          }),
          navbarItems("Syllabus", const Icon(Icons.note), () {}),
          navbarItems("Papers", const Icon(Icons.library_books), () {}),
          navbarItems("Professors", const Icon(Icons.person), () {}),
          navbarItems("Admin Panel", const Icon(Icons.person), () {
            Get.to(() => const Upload());
          }),
          navbarItems(
              "Developer (Kashif)", const Icon(Icons.person_4_outlined), () {}),
          if (currUser)
            ListTile(
              leading: const Icon(Icons.logout_rounded),
              title: const Text("Logout"),
              onTap: () async {
                await signOutGoogle();
                setState(() {});
              },
            )
          else
            ListTile(
              tileColor: Colors.deepPurple[100],
              leading: const Icon(
                Icons.login_rounded,
                color: Colors.red,
              ),
              title: Text(
                "Login",
                style: GoogleFonts.alegreya(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              onTap: () => Get.to(() => const LoginGoogle()),
            ),
          navbarItems(
              "Support", const Icon(Icons.contact_support_rounded), () {}),
        ],
      ),
    );
  }

  Widget navbarItems(String text, Icon icon, VoidCallback btn) {
    return ListTile(
      leading: icon,
      title: Text(
        text,
        style: GoogleFonts.nunito(fontWeight: FontWeight.w700),
      ),
      onTap: () => btn(),
    );
  }
}
