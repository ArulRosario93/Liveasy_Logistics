import 'package:flutter/material.dart';
import 'package:liveasy_assignment/EnterNum.dart';
import 'package:liveasy_assignment/Home.dart';
import 'package:liveasy_assignment/HomePage.dart';
import 'package:liveasy_assignment/Model/User.dart' as Model;
import 'package:liveasy_assignment/SelectProf.dart';
import 'package:liveasy_assignment/VerifyNumber.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: FirebaseOptions(
      //     apiKey: "AIzaSyCyOGwmlbutyX5C07sJOI9oAYuGdL14gFs",
      //     authDomain: "liveasy-432f8.firebaseapp.com",
      //     projectId: "liveasy-432f8",
      //     storageBucket: "liveasy-432f8.appspot.com",
      //     messagingSenderId: "755882573661",
      //     appId: "1:755882573661:web:1516cf0a3ea6e232ed32b4",
      //     measurementId: "G-7LQGPEFKM1")
      );

  runApp(MyApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.idTokenChanges(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return HomePage();
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Color.fromARGB(255, 17, 17, 17),
            ),
          );
        }
        return MyApp();
      }),
    );
  }
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String Number = "";
  String verifytheOTP = "";
  String authStatus = "";
  String language = "";
  String selected = "";
  late UserCredential res;

  @override
  Widget build(BuildContext context) {
    void selectedHere(value) async {
      print(language);
      print("ABove MEEE");
      setState(() {
        selected = value;
      });

      Model.User user = Model.User(
          MobileNumber: Number,
          uid: res.user!.uid,
          selected: selected,
          language: language);

      await _firestore.collection("Users").doc(res.user!.uid).set(
            user.toJson(),
          );
    }

    void setLanguage(value) {
      setState(() {
        language = value;
      });
    }

    Future<String> verrifyNumber(_selectedValue, number) async {
      setState(() {
        Number = _selectedValue + number;
      });
      await _auth.verifyPhoneNumber(
          phoneNumber: _selectedValue + number,
          timeout: const Duration(seconds: 15),
          verificationCompleted: (AuthCredential authCredential) {
            authStatus = "Your account is successfully verified";
          },
          verificationFailed: (FirebaseAuthException authException) {
            setState(() {
              authStatus = authException.toString();
            });
          },
          codeSent: (verificationId, forceResendingToken) {
            setState(() {
              verifytheOTP = verificationId;
              authStatus = "OTP has been successfully send";
            });
          },
          codeAutoRetrievalTimeout: (String verId) {
            setState(() {
              verifytheOTP = verId;
              authStatus = "TIMEOUT";
            });
          });

      return authStatus;

    }

    Future<String> signIn(String otp) async {
      var uid = Uuid();
      String response = "some err";
      var uid1 = uid.v1();
      String ress = "";

      print(otp);
      print("GIVEN");
      try {
        res = await FirebaseAuth.instance
            .signInWithCredential(PhoneAuthProvider.credential(
          verificationId: verifytheOTP,
          smsCode: otp,
        ));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              "The SMS verification code used to create the phone auth credential is invalid."),
        ));
      }

      if (ress != "") {
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text("The SMS verification code used to create the phone auth credential is invalid."),
        // ));
      } else {
        response = "SUCCESS";
      }
      return response;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: HomeMain(setLanguage: setLanguage),
      // initialRoute: "/",
      routes: {
        "/enterNum": (context) => EnterNum(verrifyNumber: verrifyNumber),
        "/verifyNum": (context) => VerifyNumber(
            signIn: signIn, bull: Number, verrifyNumber: verrifyNumber),
        "/selectProf": (context) => SelectProf(selectedHere: selectedHere),
      },
    );
  }
}

class HomeMain extends StatelessWidget {
  HomeMain({super.key, required this.setLanguage});

  final setLanguage;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Home(setLanguage: setLanguage),
    );
  }
}
