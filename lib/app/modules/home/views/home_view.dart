import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PushNotifications'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 160,
              height: 160,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: 50 / 50,
                  ),
                  Center(
                    child: Obx(
                      () => Text(
                        controller.textDuration.value.toString(),
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 70,
                      child: TextFormField(
                        controller: controller.minController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [LengthLimitingTextInputFormatter(2)],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 40),
                        decoration: InputDecoration(
                          fillColor: Colors.black12,
                          filled: true,
                          contentPadding: EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.blue)),
                        ),
                      ),
                    ),
                    Text('Menit')
                  ],
                ),
                Text(
                  ' : ',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 70,
                      child: TextFormField(
                        controller: controller.secController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [LengthLimitingTextInputFormatter(2)],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 40),
                        decoration: InputDecoration(
                          fillColor: Colors.black12,
                          filled: true,
                          contentPadding: EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.blue)),
                        ),
                      ),
                    ),
                    Text('Detik')
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => ElevatedButton(
                onPressed: controller.clickEnable.value
                    ? () async {
                        controller.pushNotif();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  child: Text('Notif On'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
