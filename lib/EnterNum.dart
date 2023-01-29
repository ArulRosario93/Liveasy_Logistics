import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterNum extends StatefulWidget {
  const EnterNum({super.key, required this.verrifyNumber});

  final verrifyNumber;

  @override
  State<EnterNum> createState() => _EnterNumState();
}

class _EnterNumState extends State<EnterNum> {
  String _selectedValue = "+91";
  TextEditingController mobileNum = TextEditingController();

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("+91"), value: "+91"),
      DropdownMenuItem(child: Text("+1"), value: "+1"),
      DropdownMenuItem(child: Text("+92"), value: "+92"),
      DropdownMenuItem(child: Text("+44"), value: "+44"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    void onHandeChange(value) {
      setState(() {
        _selectedValue = value;
      });
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              color: Colors.black,
            )),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: Container(),
              flex: 3,
            ),
            Container(
              child: Text(
                "Please enter your mobile number",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            Container(
              width: 180,
              child: Text(
                "You'll recieve a 4 digit code to verify next.",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 12)),
            Container(
              width: 320,
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  // border:
                  border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
                  borderRadius: BorderRadius.circular(20)),
              // padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(children: [
                Container(
                  // transformAlignment: AlignmentGeometry.lerp(a, b, t),
                  // margin: EdgeInsets.only(bottom: 13),
                  height: 30,
                  // alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Icon(Icons.flag),
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 3)),
                      DropdownButton(
                        // menuMaxHeight: 10.0,
                        // itemHeight: kMinInteractiveDimension,
                        elevation: 0,
                        iconSize: 5,
                        focusColor: Colors.transparent,
                        underline: SizedBox(),
                        isExpanded: false,
                        items: dropdownItems,
                        value: _selectedValue,
                        onChanged: (value) => onHandeChange(value),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 220,
                  child: TextField(
                    autofocus: true,
                    // focusNode: FocusNode(canRequestFocus: true),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    textAlign: TextAlign.justify,
                    controller: mobileNum,
                    // style: const TextStyle(
                    //   fontSize: 13,
                    //   fontWeight: FontWeight.w600,
                    // ),
                    decoration: InputDecoration(
                      // prefixIcon: Icon(Icons.flag),

                      // prefixText: "+91",
                      // filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              style: BorderStyle.solid, color: Colors.white)),
                      fillColor: Color(0xF2FFFFFF),
                      hoverColor: Colors.transparent,
                      // hintStyle:,
                      hintText: "Mobile Number",
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              style: BorderStyle.none,
                              color: Color.fromARGB(255, 255, 255, 255))),
                    ),
                  ),
                )
              ]),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 12)),


            InkWell(
              hoverColor: Colors.transparent,
              onTap: () async {
                  if (mobileNum.text.isNotEmpty) {
                    final authStatus = await widget.verrifyNumber(_selectedValue, mobileNum.text);
                    
                    Navigator.pushReplacementNamed(context, "/verifyNum");
                  }
                },
              child: Container(
              alignment: Alignment.center,
              width: 320,
              padding: EdgeInsets.symmetric(vertical: 18),
              color: Color.fromARGB(255, 5, 38, 95),
              child: Text(
                  "CONTINUE",
                  style: GoogleFonts.alegreyaSansSc(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ),
            ),
            ),
            
            Flexible(
              child: Container(),
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}
