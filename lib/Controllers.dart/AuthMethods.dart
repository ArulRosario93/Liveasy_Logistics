import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  
    final FirebaseAuth _auth = FirebaseAuth.instance;


    Future verifyPhoneNumber({required String number,}) async {
      // _auth.verifyPhoneNumber(verificationCompleted: verificationCompleted, verificationFailed: verificationFailed, codeSent: codeSent, codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
    }

}