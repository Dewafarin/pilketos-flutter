import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pilketos/home.dart';
import 'package:pilketos/shared/shared.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  bool _isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/bg-welcome2.png',
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: size.height * .1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .1),
              child: const Text(
                "Pemilihan Ketua Osis \nSMK Negeri 4 Malang",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .1, vertical: size.height * .03),
              child: const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: size.height * .05,
            ),
            SizedBox(
              width: size.width * .6,
              height: size.height * .065,
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return Wrap(
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(40),
                                            topLeft: Radius.circular(40)),
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: size.height * .05),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: size.height * .04,
                                            ),
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: const [
                                                    Text(
                                                      "Login",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                Center(
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Icon(
                                                      Icons.close,
                                                      color: primaryColor,
                                                      size: 22,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: size.height * .01,
                                            ),
                                            const Text(
                                              "Pemilihan Ketua Osis Grafika",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Center(
                                              child: Image.asset(
                                                'assets/images/student.png',
                                                height: size.height * .28,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * .02,
                                            ),
                                            TextField(
                                              controller: emailController,
                                              style:
                                                  const TextStyle(fontSize: 14),
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.all(
                                                    size.height * .02),
                                                border: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Color(0xff3333CC)),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                hintText: "NIS : 1899055xxxxx",
                                                labelText: "Username",
                                                prefixIcon:
                                                    const Icon(Icons.person),
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * .02,
                                            ),
                                            TextField(
                                              controller: passwordController,
                                              obscureText: _isHiddenPassword,
                                              style:
                                                  const TextStyle(fontSize: 14),
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.all(
                                                          size.height * .02),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  hintText:
                                                      "NIS : 1899055xxxxx",
                                                  labelText: "Password",
                                                  prefixIcon:
                                                      const Icon(Icons.lock),
                                                  suffixIcon: InkWell(
                                                    onTap: _tooglePasswordView,
                                                    child: Icon(_isHiddenPassword
                                                        ? Icons
                                                            .visibility_outlined
                                                        : Icons
                                                            .visibility_off_outlined),
                                                  )),
                                            ),
                                            SizedBox(
                                              height: size.height * .03,
                                            ),
                                            Center(
                                              child: Container(
                                                width: size.width * .6,
                                                height: size.height * .06,
                                                child: ElevatedButton(
                                                  onPressed: signIn,
                                                  child: const Text(
                                                    "Masuk",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  style: ElevatedButton.styleFrom(
                                                      primary: primaryColor,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30))),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * .03,
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            SizedBox(
              height: size.height * .07,
            ),
          ],
        ),
      ),
    );
  }

  void _tooglePasswordView() {
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
    });
  }

  Future signIn() async {
    Navigator.pop(context);
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }
}
