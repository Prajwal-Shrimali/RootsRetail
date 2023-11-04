import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDT3gbK2F3JGTi38U5Jq6-LQ3VLsQEM2mc",
            authDomain: "tribalsmoment.firebaseapp.com",
            projectId: "tribalsmoment",
            storageBucket: "tribalsmoment.appspot.com",
            messagingSenderId: "226390042482",
            appId: "1:226390042482:web:8ed3d804c9be11ae561feb"));
  } else {
    await Firebase.initializeApp();
  }
}
