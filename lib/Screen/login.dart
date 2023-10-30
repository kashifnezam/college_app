import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_app/Screen/homepage.dart';
import 'package:college_app/services/auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginGoogle extends StatefulWidget {
  const LoginGoogle({super.key});

  @override
  State<LoginGoogle> createState() => _LoginGoogleState();
}

class _LoginGoogleState extends State<LoginGoogle> {
  bool islogin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login with Google"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Lottie.asset("assets/animation/login.json", height: 300),
          Container(
            width: Get.width * 0.8,
            height: 50,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(60))),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.deepPurple[50],
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                  ),
                ),
                onPressed: () async {
                  setState(() {
                    islogin = true;
                  });
                  await signInWithGoogle().then((value) => {
                        debugPrint(value.additionalUserInfo.toString()),
                        debugPrint(value.user?.phoneNumber.toString()),
                        FirebaseFirestore.instance
                            .collection("user")
                            .doc(value.user?.uid)
                            .set({"user": value.user?.email, "isAdmin": false}),
                        islogin = false,
                        Get.offAll(() => const HomePage()),
                      });
                },
                child: islogin
                    ? const CircularProgressIndicator(
                        color: Colors.deepPurple,
                        
                      )
                    : const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image(
                            fit: BoxFit.fill,
                            height: 26,
                            width: 26,
                            image: AssetImage("assets/images/google.png"),
                          ),
                          Text(
                            "Sign in with Google",
                            style: TextStyle(
                                fontFamily: "AlegreyaSans",
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                                color: Colors.black),
                          ),
                        ],
                      )),
          ),
        ],
      ),
    );
  }
}
