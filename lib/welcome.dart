import 'package:flutter/material.dart';
import 'package:pilketos/daftar.dart';
import 'package:pilketos/login.dart';

class Welcomepage extends StatefulWidget {
  const Welcomepage({Key? key}) : super(key: key);

  @override
  _WelcomepageState createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg-welcome2.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 80, 20, 30),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "PILKETOS GRAFIKA \n",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      TextSpan(
                        text:
                            "\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(.0, .01, .0, 15),
                child: Container(
                  width: size.width * .6,
                  height: size.height * .06,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xff3333CC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const Login()),
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: size.width * .6,
                height: size.height * .06,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xffffffff),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Color(0xff3333CC))),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const Daftar()),
                    );
                  },
                  child: Text(
                    "Daftar",
                    style: TextStyle(
                      color: Color(0xff3333CC),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
