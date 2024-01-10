import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_education/app/controllers/auth_controller.dart';

import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  final auth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: SizedBox(
            height: 40,
            width: 375,
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: const Color(0xFFE1DEDE),
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),

        // Body
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                leading: ClipOval(
                    child: auth.currentUser?.photoUrl != null
                        ? Image.network(auth.currentUser!.photoUrl!)
                        : Icon(Icons.person)),
                title: auth.user.username != null
                    ? Text("${auth.user.username}")
                    : Text("${auth.user.name}"),
                subtitle: Text(
                  "${auth.user.email}",
                  style: TextStyle(color: Color.fromARGB(255, 0, 111, 207)),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {},
                ),
              ),
            ),

            SizedBox(
              height: 30,
            ),

            // Container Donasi
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Donasi Ke Sekolah",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Color(0xff507589),
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                "Lihat Semua",
                              ),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 300,
                    color: Colors.grey,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 100,
                            color: Colors.blue,
                            margin: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Nama Sekolah"),
                                    Text("Alamat Sekolah"),
                                    Text("Jumlah Donasi"),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
