import 'package:college_app/Screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/auth.dart';

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
            decoration: const BoxDecoration(
                image: DecorationImage(
                    opacity: 0.7,
                    image: AssetImage(
                      "assets/images/cdac.jpeg",
                    ),
                    fit: BoxFit.cover)),
          ),
          currUser
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
        ],
      ),
    );
  }
}
