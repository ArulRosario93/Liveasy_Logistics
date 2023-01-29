import 'package:flutter/material.dart';

class ProfileFormate extends StatelessWidget {
  const ProfileFormate(
      {super.key,
      required this.profileText,
      required this.ico,
      this.selectedicon,
      required this.onHandleChange});

  final profileText;
  final ico;
  final onHandleChange;
  final selectedicon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onHandleChange();
      },
      child: Container(
        width: 320,
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            border:
                Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 0.8)),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(selectedicon,
                color: Colors.black,
                size: 30,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(ico,
                color: Colors.black,
                size: 35,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      profileText,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 19),
                    ),
                  ),
                  Container(
                    width: 150,
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce quis erat urna. Nunc porttitor non leo at dictum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w100,
                          fontSize: 13),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
