import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_education/app/data/models/user_model.dart';
import 'package:my_education/app/routes/app_pages.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthControllerController
  GoogleSignInAccount? currentUser;
  GoogleSignIn googleSignIn = GoogleSignIn();
  UserCredential? userCredential;

  UserModel user = UserModel();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Login with Google
  Future<void> signInWithGoogle() async {
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

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);

        CollectionReference users = firestore.collection('users');

        final checkuser = await users.doc(userCredential!.user!.uid).get();

        if (checkuser.exists) {
          Get.offAllNamed(Routes.HOME);
        } else {
          users.doc(userCredential!.user!.uid).set({
            'uid': userCredential!.user!.uid,
            'name': userCredential!.user!.displayName,
            'username': getEmailUsername(userCredential!.user!.email!),
            'phone': "",
            'email': userCredential!.user!.email,
            'photo': userCredential!.user!.photoURL,
            'role': 'user',
          });

          Get.offAllNamed(Routes.HOME);
        }
        final currUser = await users.doc(userCredential!.user!.uid).get();
        final currUserData = currUser.data() as Map<String, dynamic>;

        user = UserModel(
          uid: currUserData['uid'],
          name: currUserData['name'],
          username: currUserData['username'],
          phone: currUserData['phone'],
          email: currUserData['email'],
          photo: currUserData['photo'],
          role: currUserData['role'],
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> register(String name, String username, String phone,
      String email, String password, String role) async {
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      CollectionReference users = firestore.collection('users');

      final checkUser = await users.doc(userCredential!.user!.uid).get();

      if (checkUser.exists) {
        Get.offAllNamed(Routes.LOGIN);
        Get.snackbar("Email sudah terdaftar", "Silahkan login");
      } else {
        users.doc(userCredential!.user!.uid).set({
          'uid': userCredential!.user!.uid,
          'name': name,
          'username': username,
          'phone': phone,
          'email': email,
          'photo': "",
          'role': role,
        });
        Get.offAllNamed(Routes.LOGIN);
        Get.snackbar("Berhasil", "Silahkan login");
        print(
            "BERHASIL REGISTER DENGAN EMAIL : " + userCredential!.user!.email!);
      }

      final currUser = await users.doc(userCredential!.user!.uid).get();
      final currUserData = currUser.data() as Map<String, dynamic>;

      user = UserModel(
        uid: currUserData['uid'],
        name: currUserData['name'],
        username: currUserData['username'],
        phone: currUserData['phone'],
        email: currUserData['email'],
        photo: currUserData['photo'],
        role: currUserData['role'],
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> login(String email, String password) async {
    try {
      userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      CollectionReference users = firestore.collection('users');

      final currUser = await users.doc(userCredential!.user!.uid).get();
      final currUserData = currUser.data() as Map<String, dynamic>;

      user = UserModel(
        uid: currUserData['uid'],
        name: currUserData['name'],
        username: currUserData['username'],
        phone: currUserData['phone'],
        email: currUserData['email'],
        photo: currUserData['photo'],
        role: currUserData['role'],
      );

      if (user.role == "user") {
        Get.offAllNamed(Routes.HOME);
        Get.snackbar("Login Sebagai User Berhasil", "Selamat Datang");
      } else if (user.role == "school") {
        Get.offAllNamed(Routes.HOME_SCHOOL);
        Get.snackbar("Login Sebagai Admin Berhasil", "Selamat Datang");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> logout() async {
    try {
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar("Berhasil", "Berhasil Logout");
    } catch (e) {
      print(e);
    }
  }

  String getEmailUsername(String email) {
    List<String> parts = email.split('@');
    if (parts.length > 1) {
      return parts[0]; // Mengembalikan bagian sebelum '@'
    }
    return email; // Jika tidak ada '@', kembalikan keseluruhan alamat email
  }
}
