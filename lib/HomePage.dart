import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Colors.white,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
                // color:,
                child: Center(
                    child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 69)),
            Container(
              child: Text(
                "You've Logged IN",
                style: GoogleFonts.alegreyaSansSc(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 25)),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("LogOut"),
            )
          ],
        )))));
  }
}
