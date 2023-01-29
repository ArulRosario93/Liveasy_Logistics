import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liveasy_assignment/TextInput.dart';
import 'package:telephony/telephony.dart';

class VerifyNumber extends StatefulWidget {
  const VerifyNumber({
    super.key,
    required this.signIn,
    this.verrifyNumber,
    required this.bull,
  });

  final verrifyNumber;
  final signIn;
  final bull;

  @override
  State<VerifyNumber> createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();

  String sig = "";
  String signature = "";

  bool verified = false;

  Telephony tele = Telephony.instance;

  void getSms() async {
    tele.listenIncomingSms(
        onNewMessage: (SmsMessage message) {
          String sms = message.body!;
          String otpcode = sms.replaceAll(new RegExp(r'[^0-9]'), '');
          //prase code from the OTP sms

          // for (var i = 0; i < 6; i++) {
          setState(() {
            controller1.text = otpcode[0];
            controller2.text = otpcode[1];
            controller3.text = otpcode[2];
            controller4.text = otpcode[3];
            controller5.text = otpcode[4];
            controller6.text = otpcode[5];
            // controller1.text = otpcode[];
          });
          if (controller6.text.isNotEmpty) {
            setcode();
          }
        },
        listenInBackground: false);
  }

  void setcode() async {
    setState(() {
      verified = true;
    });

    print("Checking");
    String ControllIT = controller1.text +
        controller2.text +
        controller3.text +
        controller4.text +
        controller5.text +
        controller6.text;

    print(ControllIT);
    print("Checking");
    final response = await widget.signIn(ControllIT);

    print(response);

    if (response == "SUCCESS") {
      Navigator.pushReplacementNamed(context, "/selectProf");
    }
  }

  @override
  void initState() {
    getSms();

    //     .then((value) => print('signature - $value'));
    // controller = OTPTextEditController(
    //   codeLength: 5,
    //   onCodeReceive: (code) => print('Your Application receive code - $code'),
    // )..startListenUserConsent(
    //     (code) {
    //       final exp = RegExp(r'(\d{5})');
    //       return exp.stringMatch(code ?? '') ?? '';
    //     },
    //     strategies: [
    //       SampleStrategy(),
    //     ],
    //   );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void changeState() async {
      setState(() {
        verified = true;
      });
      String ControllIT = controller1.text +
          controller2.text +
          controller3.text +
          controller4.text +
          controller5.text +
          controller6.text;

      final response = await widget.signIn(ControllIT);

      if (response == "SUCCESS") {
        Navigator.pushReplacementNamed(context, "/selectProf");
      }
    }

    void signIN(ControllIT) async {
      final response = await widget.signIn(ControllIT);
      if (response == "SUCCESS") {
        
        Navigator.pushReplacementNamed(context, "/selectProf");
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: Container(),
              flex: 2,
            ),
            Container(
              child: Text(
                "Verify Phone",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            Container(
              child: Text(
                "Code Sent to ${widget.bull}",
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Container(
              width: 320,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextInput(autoFocus: true, controller: controller1),
                  TextInput(autoFocus: true, controller: controller2),
                  TextInput(autoFocus: true, controller: controller3),
                  TextInput(autoFocus: true, controller: controller4),
                  TextInput(autoFocus: true, controller: controller5),
                  TextInput(
                      autoFocus: true,
                      controller: controller6,
                      changeState: changeState),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            Container(
              width: 320,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive the code? ",
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                  TextButton(
                      onPressed: () {
                        widget.verrifyNumber(widget.bull);
                      },
                      child: Text(
                        "Request Again",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ))
                ],
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 8)),


            InkWell(
              hoverColor: Colors.transparent,
              onTap: () {
                  if (controller1.text.isNotEmpty ||
                      controller2.text.isNotEmpty ||
                      controller3.text.isNotEmpty ||
                      controller4.text.isNotEmpty ||
                      controller5.text.isNotEmpty ||
                      controller6.text.isNotEmpty) {
                    String ControllIT = controller1.text +
                        controller2.text +
                        controller3.text +
                        controller4.text +
                        controller5.text +
                        controller6.text;
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Signing you in"),
                    ));
                    signIN(ControllIT);
                  }
                },
              child: Container(
              width: 320,
              color: Color.fromARGB(255, 10, 52, 87),
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
              child: TextButton(
                onPressed: () {
                  if (controller1.text.isNotEmpty ||
                      controller2.text.isNotEmpty ||
                      controller3.text.isNotEmpty ||
                      controller4.text.isNotEmpty ||
                      controller5.text.isNotEmpty ||
                      controller6.text.isNotEmpty) {
                    String ControllIT = controller1.text +
                        controller2.text +
                        controller3.text +
                        controller4.text +
                        controller5.text +
                        controller6.text;
                    signIN(ControllIT);
                  }
                },
                child: verified
                    ? CircularProgressIndicator(
                        color: Color.fromARGB(255, 255, 255, 255),
                      )
                    : Text(
                        "Verify and continue",
                        style: GoogleFonts.alegreyaSansSc(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 18)),
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
