import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_education/app/data/models/content_donation_model.dart';
import 'package:platform_file/platform_file.dart' as platform_file;

class ContentController extends GetxController {
  //TODO: Implement ContentController

  var selectDate = DateTime.now().obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference? db;
  ContentDonation contentDonates = ContentDonation();
  final contentList = RxList<ContentDonation>();
  UserCredential? userCredential;

  Future<void> display() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('content').get();

      contentList.value =
          querySnapshot.docs.map((e) => ContentDonation.fromJson(e)).toList();
      update();
    } catch (e) {
      print(e);
      Get.snackbar("${e}", "${e}");
    }
  }

  Future<void> addContent(
      String id,
      String title,
      String description,
      String location,
      String date,
      String target,
      String status,
      String photo) async {
    CollectionReference user = firestore.collection('users');
    CollectionReference content = firestore.collection('content');
    String loggedUser = FirebaseAuth.instance.currentUser!.uid;
    try {
      DocumentReference konten = await content.add({
        'category': "Donasi",
        'deadline': date,
        'description': description,
        'donation_target': target,
        'idContent': "",
        'idUser': loggedUser,
        'location': location,
        'photo': photo,
        'status': status,
        'title': title,
        'viewers': 0,
      });

      String idContent = konten.id;
      await content.doc(idContent).update({
        'idContent': idContent,
      });

      await content.doc(idContent).collection('users').doc(loggedUser).set({
        'idContent': idContent,
        'idUser': FirebaseAuth.instance.currentUser!.uid,
        'name': FirebaseAuth.instance.currentUser!.displayName,
        'photo': FirebaseAuth.instance.currentUser!.photoURL,
        'email': FirebaseAuth.instance.currentUser!.email,
      });

      Get.snackbar("Berhasil", "Data berhasil ditambahkan");
    } catch (e) {
      print(e);
    }
  }

  PlatformFile? platformFile;
  String? url;
  Future<void> addImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'jpeg'],
      );

      if (result != null) {
        platformFile = await result.files.first;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> uploadFile() async {
    try {
      final path = 'images/${platformFile!.name}';
      final file = File(platformFile!.path!);

      final ref = FirebaseStorage.instance.ref().child(path);
      ref.putFile(file);
      url = await ref.getDownloadURL();
      print("URL DI AUTH: $url");
    } catch (e) {
      print('Error uploading file: $e');
    }
  }

  Future<void> clrearImage() async {
    platformFile = null;
  }
}
