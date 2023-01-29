import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:liveasy_assignment/HomePage.dart';
import 'package:liveasy_assignment/ProfileFormate.dart';

class SelectProf extends StatefulWidget {
  const SelectProf({super.key, required this.selectedHere});

  final selectedHere;

  @override
  State<SelectProf> createState() => _SelectProfState();
}

class _SelectProfState extends State<SelectProf> {
  String _selected = "";
  String intSelected = "";

  @override
  Widget build(BuildContext context) {
    void handleChangeShipper() {
      setState(() {
        _selected = "Shipper";
        intSelected = "0";
      });
    }

    void handleChangetruck() {
      setState(() {
        _selected = "transporter";
        intSelected = "1";
      });
    }

    void handleChange() async {
     await widget.selectedHere(_selected);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Signing you in"),
      ));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => HomePage())));
    }

    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Container(),
              flex: 1,
            ),
            Container(
              child: Text(
                "Please select your profile",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 12)),
            ProfileFormate(
                profileText: "Shipper",
                ico: Icons.home_outlined,
                selectedicon: intSelected == "0"
                    ? CupertinoIcons.smallcircle_circle
                    : Icons.circle_outlined,
                onHandleChange: handleChangeShipper),
            Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            ProfileFormate(
                profileText: "Transporter",
                ico: Icons.fire_truck_outlined,
                selectedicon: intSelected == "1"
                    ? CupertinoIcons.smallcircle_fill_circle
                    : Icons.circle_outlined,
                onHandleChange: handleChangetruck),
            Padding(padding: EdgeInsets.symmetric(vertical: 18)),
            Container(
              width: 320,
              padding: EdgeInsets.symmetric(vertical: 8),
              color: Color.fromARGB(255, 22, 64, 99),
              child: TextButton(
                onPressed: () {
                  handleChange();
                },
                child: Text(
                  "Continue",
                  style: GoogleFonts.alegreyaSansSc(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Container(),
              flex: 3,
            )
          ],
        ),
      ),
    );
  }
}
