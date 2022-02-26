import 'package:flutter/material.dart';

class Daftar extends StatefulWidget {
  const Daftar({Key? key}) : super(key: key);

  @override
  _DaftarState createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3333CC),
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
              image: AssetImage("assets/images/bg-daftar.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Image.asset(
                  "assets/images/logo-grafika.png",
                  height: 50,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo-grafika.png"),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo-grafika.png"),
                  ),
                ),
              ),
            ),
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
