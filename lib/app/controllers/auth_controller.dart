import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_education/app/routes/app_pages.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthControllerController
  GoogleSignInAccount? currentUser;
  GoogleSignIn googleSignIn = GoogleSignIn();
  UserCredential? userCredential;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> login() async {
    try {

      // mencegah kebocoran data login
      await googleSignIn.signOut();

      // mengambil akun google
      await googleSignIn.signIn().then((value) {
        currentUser = value;
        print(currentUser);
      });

      // cek apakah sudah login
      final isSignIn = await googleSignIn.isSignedIn();

      if (isSignIn) {
        print(
            "SUDAH BERHASIL LOGIN DENGAN AKUN : " + currentUser!.displayName!);

        // Create a new credential
        final googleAuth = await currentUser!.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential).then((value) => userCredential = value);

        CollectionReference users = firestore.collection('users');

        final checkuser = await users.doc(userCredential!.user!.uid).get();

        if (checkuser.exists) {
          Get.offAllNamed(Routes.HOME);
        } else {
          users.doc(userCredential!.user!.uid).set({
            'name': userCredential!.user!.displayName,
            'email': userCredential!.user!.email,
            'photo': userCredential!.user!.photoURL,
            'uid': userCredential!.user!.uid,
            'role': 'user',
          });

          Get.offAllNamed(Routes.HOME);
          
        }

      }
    } catch (e) {
      print(e);
    }
  }
}
