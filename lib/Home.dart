import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class Home extends StatefulWidget {
  const Home({super.key, required this.setLanguage});

  final setLanguage;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _selectedValue = "English";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("English"), value: "English"),
      DropdownMenuItem(child: Text("Chinese"), value: "Chinese"),
      DropdownMenuItem(child: Text("German"), value: "German"),
      DropdownMenuItem(child: Text("Hindi"), value: "Hindi"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    void onHandleChange(value) {
      setState(() {
        _selectedValue = value;
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("The selected value $value."),
        ));

      widget.setLanguage(value);
    }

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: Container(),
              flex: 5,
            ),
            Container(
              child: Icon(
                Icons.image_outlined,
                color: Color.fromARGB(255, 26, 26, 26),
                size: 50,
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 12)),
            Container(
              child: Text(
                "Please select your Language",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    wordSpacing: 0,
                    letterSpacing: 0),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            Container(
              width: 200,
              child: Text(
                "You can change the language at any time.",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 12)),
            Container(
              width: 250,
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 0, 0, 0), width: 0.2)),
              child: DropdownButton(
                focusColor: Colors.transparent,
                underline: SizedBox(),
                isExpanded: true,
                items: dropdownItems,
                value: _selectedValue,
                onChanged: (value) => onHandleChange(value),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 12)),
            
            InkWell(
              hoverColor: Colors.transparent,
              onTap: (){
                Navigator.pushNamed(context, "/enterNum");
              },
              child: Container(
              width: 250,
              padding: EdgeInsets.symmetric(
                vertical: 18,
              ),
              alignment: Alignment.center,
              color: Color.fromARGB(255, 5, 38, 95),
              child: Text(
                  "NEXT",
                  style: GoogleFonts.alegreyaSansSc(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              )
            ),
            
            Flexible(
              child: Container(),
              flex: 3,
            ),
            Container(
              height: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(
                          "https://static.vecteezy.com/system/resources/thumbnails/002/018/302/original/abstract-sea-blue-sky-background-free-video.jpg"))),
            ),
          ],
        ),
      ),
    );
  }
}
