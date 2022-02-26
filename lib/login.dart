import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffffffff),
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              "assets/images/logo-grafika.png",
              fit: BoxFit.contain,
              height: size.height * .07,
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg-login.png"),
              fit: BoxFit.fill),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
                child: Container(
              height: size.height * 0.8,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/student.png"),
                ),
              ),
            )),
          ],
        ),

        /*child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/logo-grafika.png"),
                  ),
                ),
              ),
            ),
          ],
        ),*/
      ),
      /*children: [
        Positioned(
          top: size.height * .08,
          right: 0,
          child: Image(
            image: AssetImage("assets/logo-grafika.png"),
          ),
        ),
      ],*/
    );
  }
}
