import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pilketos/shared/shared.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  get secondaryColor => null;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .42,
            decoration: BoxDecoration(color: primaryColor),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    alignment: Alignment.center,
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                        color: whiteColor, shape: BoxShape.circle),
                    child: Icon(
                      Icons.account_circle_rounded,
                      color: secondaryColor,
                      size: 36.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Text(user!.email! + "\nTemukan Ketua Osis Pilihanmu",
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: .75,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: <Widget>[
                      Jadwal(
                        title: "Kandidat Ketua Osis",
                        iconSrc: 'assets/images/voteicon.png',
                        press: () {},
                      ),
                      Jadwal(
                        title: "Jadwal Pilketos",
                        iconSrc: 'assets/images/jadwal.png',
                        press: () {},
                      ),
                      Jadwal(
                        title: "Hasil Pilketos",
                        iconSrc: 'assets/images/hasil.png',
                        press: () {},
                      ),
                      Jadwal(
                        title: "Info Sekolah",
                        iconSrc: 'assets/images/pilketos.png',
                        press: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50)),
                  icon: Icon(Icons.arrow_back, size: 32),
                  label: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: () => FirebaseAuth.instance.signOut(),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class Jadwal extends StatelessWidget {
  final String iconSrc;
  final String title;
  final Function() press;
  const Jadwal({
    Key? key,
    required this.iconSrc,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 15),
                blurRadius: 17,
                spreadRadius: -23,
                color: Colors.black,
              )
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Image.asset(
                    iconSrc,
                    height: 110,
                    fit: BoxFit.fill,
                  ),
                  Spacer(),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
