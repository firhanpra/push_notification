import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/next_page_controller.dart';

class NextPageView extends GetView<NextPageController> {
  String? payload;
  NextPageView({@required this.payload});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageNotification'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              payload!,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 100,
              height: 100,
              child: Image(
                image: AssetImage('assets/tes.png'),
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
