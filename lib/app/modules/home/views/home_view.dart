import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_education/app/controllers/auth_controller.dart';
import 'package:my_education/app/controllers/content_controller.dart';
import 'package:my_education/app/data/models/content_donation_model.dart';
import 'package:my_education/app/modules/detailDonation/views/detail_donation_view.dart';

import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  final auth = Get.find<AuthController>();
  final donate = Get.find<ContentController>();

  @override
  Widget build(BuildContext context) {
    donate.display();
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
                  Container(
                    color: Colors.blue,
                    width: double.infinity,
                    height: 300,
                    child: GetBuilder<ContentController>(
                      init: donate,
                      builder: (controller) {
                        // Check if the data is still loading

                        // Display the data using ListView.builder
                        return Container(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.contentList.length,
                            itemBuilder: (context, index) {
                              print(controller.contentList.length);
                              ContentDonation item =
                                  controller.contentList[index];

                              // Your UI code for displaying each item
                              return Container(
                                color: Colors.amber,
                                width: 300,
                                height: 200,
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => DetailDonationView(
                                          item: item,
                                        ));
                                  },
                                  child: Card(
                                    child: ListTile(
                                      title: Text("${item.title}"),
                                      subtitle: Text("${item.description}"),
                                      // Add other UI components as needed
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
