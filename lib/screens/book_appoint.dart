import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_appointments/model/appoint_model.dart';
import 'package:doctors_appointments/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../NavBar/notice_screen.dart';
import '../colors.dart';
import '../components/button2.dart';
import '../model/dataconverted.dart';
import '../model/doctor_model.dart';

class BookAppoint extends StatefulWidget {
  const BookAppoint({super.key, required this.documentId});
  final String documentId;

  @override
  State<BookAppoint> createState() => _BookAppointState();
}

class _BookAppointState extends State<BookAppoint> {
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;
  DoctorModel loggedInDoct = DoctorModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("doctors")
        .doc(widget.documentId)
        .get()
        .then((value) {
      this.loggedInDoct = DoctorModel.fromMap(value.data());
      setState(() {});
    });
  }

  _enroll() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    final getTime = DataConverted.getTime(_currentIndex!);

    AppointModel appointModel = AppointModel();

    appointModel.doctor =
        "${loggedInDoct.surname} ${loggedInDoct.firstname} ${loggedInDoct.patronymic}";
    appointModel.user = user!.uid;
    appointModel.date =
        '${_currentDay.day}.${_currentDay.month}.${_currentDay.year}';
    appointModel.status = 'Активно';
    appointModel.time = getTime;

    await firebaseFirestore
        .collection("appointments")
        .doc()
        .set(appointModel.toMap());
    Fluttertoast.showToast(msg: "Вы успешно записались на прием!");
  }

  Widget _tableCalendar() {
    return SafeArea(
      child: TableCalendar(
        startingDayOfWeek: StartingDayOfWeek.monday,
        focusedDay: _focusDay,
        firstDay: DateTime.now(),
        lastDay: DateTime(2023, 12, 31),
        calendarFormat: _format,
        currentDay: _currentDay,
        rowHeight: 48,
        calendarStyle: const CalendarStyle(
          todayDecoration: BoxDecoration(
            color: pColor,
            shape: BoxShape.circle,
          ),
        ),
        availableCalendarFormats: const {
          CalendarFormat.month: 'Month',
        },
        onFormatChanged: (format) {
          setState(() {
            _format = format;
          });
        },
        onDaySelected: ((selectedDay, focuseDay) {
          setState(() {
            _currentDay = selectedDay;
            _focusDay = focuseDay;
            _dateSelected = true;

            if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
              _isWeekend = true;
              _timeSelected = false;
              _currentIndex = null;
            } else {
              _isWeekend = false;
            }
          });
        }),
        calendarBuilders: CalendarBuilders(
          dowBuilder: (context, day) {
            if (day.weekday == DateTime.sunday) {
              final text = DateFormat.E().format(day);
              return Center(
                child: Text(
                  text,
                  style: TextStyle(color: Colors.red),
                ),
              );
            }
            if (day.weekday == DateTime.saturday) {
              final text = DateFormat.E().format(day);
              return Center(
                child: Text(
                  text,
                  style: TextStyle(color: Colors.red),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Запись на прием'),
        backgroundColor: Color(0xFF0C84FF),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                _tableCalendar(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  child: Center(
                    child: Text(
                      "Выберите время",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _isWeekend
              ? SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 30),
                    alignment: Alignment.center,
                    child: const Text(
                      "В данный день нельзя сделать запись.",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                            _timeSelected = true;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _currentIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            color: _currentIndex == index
                                ? Color(0xFF0C84FF)
                                : null,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "${index + 9}:${index + 9 > 12 ? "30" : "00"} ${index + 9 > 11 ? "PM" : "AM"}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  _currentIndex == index ? Colors.white : null,
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: 10,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.5,
                  ),
                ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Button(
                width: double.infinity,
                title: "Записаться",
                onPressed: () {
                  _enroll();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                disable: _timeSelected && _dateSelected ? false : true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
