import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_education/app/controllers/auth_controller.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';
import 'package:my_education/app/controllers/content_controller.dart';

import '../controllers/home_school_controller.dart';

class HomeSchoolView extends GetView<HomeSchoolController> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ContentController>();
    final auth = Get.find<AuthController>();

    print(auth.userCredential!.user!.uid);
    final DateTime selectedDate = DateTime.now();

    final date =
        TextEditingController(text: DateFormat.yMd().format(selectedDate));
    final title = TextEditingController();
    final description = TextEditingController();
    final location = TextEditingController();
    final target = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeSchoolView'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          TextFormField(
            controller: title,
            decoration: InputDecoration(
              label: Text("Title"),
            ),
          ),

          TextFormField(
            controller: description,
            decoration: InputDecoration(
              label: Text("Description"),
            ),
          ),

          // location
          TextFormField(
            controller: location,
            decoration: InputDecoration(
              label: Text("Location"),
            ),
          ),

          // date
          TextFormField(
            controller: date,
            decoration: InputDecoration(
              label: Text("Date"),
            ),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(1950),
                lastDate: DateTime(2090),
              );

              if (pickedDate != null) {
                date.text = DateFormat.yMd().format(pickedDate);
              }
            },
          ),

          //Donation target
          TextFormField(
            controller: target,
            decoration: InputDecoration(
              label: Text("Donation Target"),
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),

          ElevatedButton(
              onPressed: () {
                int? targetInt = int.tryParse(target.text);
                controller.addContent(
                    auth.userCredential!.user!.uid,
                    title.text,
                    description.text,
                    location.text,
                    date.text,
                    target.text,
                    "donasi");
              },
              child: Text("Submit"))
        ],
      )),
    );
  }
}
