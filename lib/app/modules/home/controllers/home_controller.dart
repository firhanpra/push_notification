import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:push_notification/app/modules/nextPage/views/next_page_view.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  TextEditingController minController = TextEditingController(text: '00');
  TextEditingController secController = TextEditingController(text: '00');

  var textDuration = 0.obs;
  var clickEnable = true.obs;

  @override
  void onInit() {
    super.onInit();
    //inisial timezone & localnotifications
    tz.initializeTimeZones();
    var initializationSettingsAndroid = AndroidInitializationSettings('tes');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOs);

    flutterLocalNotificationsPlugin.initialize(initSettings,
        onSelectNotification: selectNotification);
  }

  Future selectNotification(String? payload) async {
    Get.to(NextPageView(payload: payload));
  }

  //countdown timer tampilan
  countDown(int value) async {
    clickEnable.value = false;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (textDuration.value == 0) {
        timer.cancel();
        clickEnable.value = true;
      } else {
        textDuration--;
      }
    });
  }

  //hitung durasi & eksekusi notification
  Future<void> pushNotif() async {
    int intMin = int.parse(minController.text);
    int intSec = int.parse(secController.text);
    int dur = (intMin * 60) + intSec;
    textDuration.value = dur;
    await countDown(dur);

    if (dur != 0) {
      await flutterLocalNotificationsPlugin.zonedSchedule(
          0,
          'BintoroCorp',
          'Ini waktunya makan siang',
          tz.TZDateTime.now(tz.local).add(Duration(seconds: dur)),
          const NotificationDetails(
              android: AndroidNotificationDetails(
                  'your channel id', 'your channel name',
                  channelDescription: 'your channel description')),
          androidAllowWhileIdle: true,
          payload: 'Page untuk makan siang',
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime);
    }
  }

  // tz.TZDateTime _nextInstanceOfTenAM() {
  //   final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  //   tz.TZDateTime scheduledDate =
  //       tz.TZDateTime(tz.local, now.year, now.month, now.day, 12, 25);
  //   if (scheduledDate.isBefore(now)) {
  //     scheduledDate = scheduledDate.add(const Duration(days: 1));
  //   }
  //   return scheduledDate;
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
