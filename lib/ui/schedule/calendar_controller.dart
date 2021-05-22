import 'dart:collection';

import 'package:brave_girls/controllers/supabase_controller.dart';
import 'package:brave_girls/models/scheduleEventModel.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarController extends GetxController {
  CalendarController get to {
    if (!Get.isRegistered<CalendarController>()) Get.lazyPut(() => CalendarController(), fenix: true);

    return Get.find();
  }

  late SupaBaseController supaBaseController;

  late DateTime firstDate;
  late DateTime endDate;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<DateTime> selectedDay = DateTime.now().obs;
  Rx<DateTime> headerDate = DateTime.now().obs;

  RxInt categoryIndex = 0.obs;

  // 기념일 / 방송 / 공연 / 라디오 / 녹화 / 기타
  final List<String> categoryNames = ["기념일", "방송", "공연", "라디오", "녹화", "기타"];

  final List<Color> categoryColors = [
    Colors.blue,
    Colors.pink,
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.brown,
  ];

  RxBool isTodayFloatingButtonVisible = false.obs;

  RxList<ScheduleEvent> events = <ScheduleEvent>[].obs;

  Map<DateTime, List> get eventMap => Map.fromIterable(events, key: (e) => DateTime.parse(e.startDate), value: (e) => [e.startDate]);


  @override
  void onInit() {
    supaBaseController = Get.find();
    getScheduleData();
    update();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onPageChanged(DateTime focusDay) {
    headerDate.value = focusDay;
    focusedDay.value = focusDay;
    selectedDay.value = focusDay;
  }

  void onDaySelected(DateTime selectDay, DateTime focusDay) {
    if (!isSameDay(selectedDay.value, selectDay)) {
      selectedDay.value = selectDay;
      focusedDay.value = focusDay;
    }
  }

  List eventLoader(DateTime day) {
    DateTime formattedDate = DateTime(day.year, day.month, day.day, 0, 0, 0, 0, 0);

    var event;

    if(eventMap.isNotEmpty) {
      event = eventMap[formattedDate];
    }

    if (event == null) {
      return [];
    }

    return event.toList();
  }

  void getScheduleData() async {
    var result = await supaBaseController.getSchedule();

    if (result != null) {
      for(var event in result) {
        events.add(ScheduleEvent.fromJson(event));
      }
      events.refresh();
    }
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }
}
