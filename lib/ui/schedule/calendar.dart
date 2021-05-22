import 'package:brave_girls/ui/schedule/calendar_controller.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatelessWidget {
  final CalendarController controller = CalendarController().to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Obx(() => todayFloatingButton()),
      body: SafeArea(
        child: Column(
          children: [
            buildHeader(),
            buildCategory(),
            buildCalendar(context),
          ],
        ),
      ),
    );
  }

  Widget buildCalendar(BuildContext context) {
    return Obx(() =>
            MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: TableCalendar(
                locale: 'ko_KR',
                rowHeight: 44,
                headerVisible: false,
                firstDay: DateTime(1800, 1, 1),
                lastDay: DateTime(2100, 12, 31),
                focusedDay: controller.focusedDay.value,
                selectedDayPredicate: (day) => isSameDay(controller.selectedDay.value, day),
                calendarFormat: CalendarFormat.month,
                startingDayOfWeek: StartingDayOfWeek.sunday,
                eventLoader: controller.eventLoader,
                onCalendarCreated: (_) {

                },
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  outsideDaysVisible: true,
                  weekendTextStyle: TextStyle().copyWith(color: Color.fromARGB(255, 153, 153, 153), fontFamily: "Avenir Next", fontWeight: FontWeight.w500, fontSize: 15),
                  defaultTextStyle: TextStyle().copyWith(
                    color: Color.fromARGB(255, 153, 153, 153),
                    fontFamily: "NotoSansKR Medium",
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  disabledTextStyle: TextStyle().copyWith(color: Color.fromARGB(255, 153, 153, 153), fontFamily: "Avenir Next", fontWeight: FontWeight.w500, fontSize: 15),
                  markerMargin: EdgeInsets.only(left: 4, right: 4),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle().copyWith(
                    color: Color.fromARGB(255, 152, 157, 179),
                    fontFamily: "NotoSansKR Regular",
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                  ),
                  weekendStyle: TextStyle().copyWith(
                    color: Color.fromARGB(255, 247, 132, 132),
                    fontFamily: "NotoSansKR Regular",
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                  ),
                ),
                calendarBuilders: CalendarBuilders(
                  selectedBuilder: (context, date, _) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          child: Container(
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(77, 138, 163, 248),
                                ),
                                child: Container(),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          child: Text(
                            '${date.day}',
                            textScaleFactor: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 94, 125, 233),
                              fontFamily: "NotoSansKR Regular",
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  todayBuilder: (context, date, _) {
                    return Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 221, 221, 221),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Align(
                            child: Text(
                              '${date.day}',
                              textScaleFactor: 1,
                              style: TextStyle().copyWith(
                                color: Color.fromARGB(255, 153, 153, 153),
                                fontFamily: "NotoSansKR Regular",
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  markerBuilder: (context, date, events) {
                    Widget marker = SizedBox();

                    if (events.isNotEmpty) {
                      marker = Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: _buildEventsMarker(date, events),
                      );
                    }

                    return marker;
                  },
                ),
                onDaySelected: controller.onDaySelected,
                onPageChanged: controller.onPageChanged,
              ),
            ),
          );
  }

  Widget buildHeader() {
    return Obx(() =>
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 15,
                    color: Colors.black,
                  ),
                  onTap: () {
                    var prevYear = controller.headerDate.value.year;
                    var prevMonth = controller.headerDate.value.month - 1;

                    var prevDateTime = DateTime(prevYear, prevMonth, 1);
                    controller.onPageChanged(prevDateTime);
                  },
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
                    child: Text(
                      '${DateFormat('yyyy.MM').format(controller.headerDate.value)}',
                      textScaleFactor: 1,
                      style: TextStyle(
                        color: Color.fromARGB(255, 51, 51, 51),
                        fontFamily: "NotoSansKR Bold",
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.black,
                  ),
                  onTap: () {
                    var nextYear = controller.headerDate.value.year;
                    var nextMonth = controller.headerDate.value.month + 1;

                    var nextDateTime = DateTime(nextYear, nextMonth, 1);
                    controller.onPageChanged(nextDateTime);
                  },
                ),
              ],
            ),
          );
  }

  Widget todayFloatingButton() {
    DateTime today = DateTime.now();
    DateTime calendarSelectedDay = controller.selectedDay.value;

    return Visibility(
      visible: (!(today.year == calendarSelectedDay.year && today.month == calendarSelectedDay.month && today.day == calendarSelectedDay.day)),
      child: GestureDetector(
        onTap: () {
          if (!controller.isTodayFloatingButtonVisible.value) {
            controller.isTodayFloatingButtonVisible.value = !controller.isTodayFloatingButtonVisible.value;
          }

          controller.onPageChanged(today);

          Fimber.d('오늘 버튼 클릭: ${today.toString().substring(0, 10)}');
        },
        child: Image.asset(
          "assets/images/today.png",
          fit: BoxFit.none,
        ),
      ),
    );
  }

  Widget buildCategory() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8, bottom: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(controller.categoryNames.length, (index) => Obx(() => categoryItem(index: index)))
        ),
      ),
    );
  }

  Widget categoryItem({required int index}) {
    // 기념일 / 방송/ 공연 / 라디오 / 기타 / 녹화
    var name = controller.categoryNames[index];
    var color = controller.categoryColors[index];

    bool isSelected = false;

    if(controller.categoryIndex.value == index)
      isSelected = true;

    return InkWell(
      onTap: () {
        controller.categoryIndex.value = index;
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color),
          color: isSelected ? color : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(
              Icons.check,
              color: isSelected ? Colors.white : color,
              size: 15,
            ),
            const SizedBox(width: 3),
            Text(
              name,
              style: TextStyle(
                color: isSelected ? Colors.white : color,
                fontFamily: "NotoSansKR Regular",
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return Container(
      alignment: Alignment.center,
      width: 28,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 30,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 11,
                    width: 5,
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/dot-ok.png", height: 4, width: 4, fit: BoxFit.none),
                  ),

                  Text(
                    '${events.length}',
                    textScaleFactor: 1,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(255, 99, 127, 223),
                      fontFamily: "Avenir Next",
                      fontWeight: FontWeight.w400,
                      fontSize: 8,
                    ),
                  ), // i == 0 ? "" : " "
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
