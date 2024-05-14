import 'package:flutter/material.dart';
import 'package:project_praq/SimpleWidgetDrawer/ewallet.dart';
import 'package:project_praq/homepage.dart';

class SimpleWidget extends StatelessWidget {
  const SimpleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.watch)),
            Tab(icon: Icon(Icons.wallet)),
          ])),
          drawer: DrawerJek(),
          body: const TabBarView(children: [
            TimeNDate(),
            EwalletJek(),
          ]),
        ));
  }
}

class TimeNDate extends StatelessWidget {
  const TimeNDate({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("DATE",
            style: TextStyle(
                fontSize: 30,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
                decorationThickness: 1)),
        DateJek(),
        Divider(),
        Text("TIME",
            style: TextStyle(
                fontSize: 30,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
                decorationThickness: 1)),
        TimeJek()
      ]),
    );
  }
}

class DateJek extends StatefulWidget {
  const DateJek({super.key});

  @override
  State<DateJek> createState() => _DateJekState();
}

class _DateJekState extends State<DateJek> {
  String start = "Start";
  String end = "End";

  Future<DateTime?> getDate() async {
    final date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        lastDate: DateTime(2030),
        firstDate: DateTime(2000));
    return date;
  }

  String convertdate(DateTime date) {
    String month = date.month.toString().padLeft(2, '0');
    String day = date.day.toString().padLeft(2, '0');
    String conDate = "${date.year}-$month-$day";
    return conDate;
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      SizedBox(
          height: 50,
          width: 150,
          child: ElevatedButton(
            onPressed: () async {
              final date = await getDate();

              if (date == null) {
                return;
              } else if (end == "End" || date.isBefore(DateTime.parse(end))) {
                setState(() {
                  start = convertdate(date);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Start date has been set")));
              } else {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                            title: const Text("Date Conflict",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
                            content: Text(
                                "Start date can't be later than End date",
                                style: TextStyle(color: Colors.red)),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("Close"))
                            ]));
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder()),
            child: Text(
              start,
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          )),
      Text("-", style: TextStyle(fontSize: 70)),
      SizedBox(
          height: 50,
          width: 150,
          child: ElevatedButton(
            onPressed: () async {
              final _date = await getDate();

              if (_date == null) {
                return;
              } else if (start == "Start" ||
                  _date.isAfter(DateTime.parse(start))) {
                setState(() {
                  end = convertdate(_date);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("End date has been set")));
              } else {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                            title: Text("Date Conflict",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
                            content: Text(
                                "End date can't be earlier than start date",
                                style: TextStyle(color: Colors.red)),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("Close"))
                            ]));
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder()),
            child: Text(
              end,
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ))
    ]);
  }
}

class TimeJek extends StatefulWidget {
  const TimeJek({super.key});

  @override
  State<TimeJek> createState() => _TimeJekState();
}

class _TimeJekState extends State<TimeJek> {
  TimeOfDay? timeS;
  TimeOfDay? timeE;

  Future<TimeOfDay?> getTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    return time;
  }

  bool comTime(TimeOfDay? Stime, TimeOfDay? Etime) {
    if (Stime == null || Etime == null) {
      return false;
    } else if (Stime.hour == Etime.hour) {
      if (Stime.minute < Etime.minute) {
        return true;
      } else {
        return false;
      }
    } else if (Stime.hour < Etime.hour) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      SizedBox(
        height: 50,
        width: 150,
        child: ElevatedButton(
            onPressed: () async {
              final time = await getTime();
              if (time == null) {
                return;
              } else {
                if (timeE == null || comTime(time, timeE)) {
                  setState(() {
                    timeS = time;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Start time has been set")));
                } else {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                              title: Text("Time Conflict",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold)),
                              content: Text(
                                  "Start time can't be later than End time",
                                  style: TextStyle(color: Colors.red)),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Close'),
                                )
                              ]));
                }
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder()),
            child: timeS == null
                ? Text(
                    "Start",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  )
                : Text(timeS!.format(context),
                    style: TextStyle(color: Colors.white, fontSize: 17))),
      ),
      Text("-", style: TextStyle(fontSize: 70)),
      SizedBox(
        height: 50,
        width: 150,
        child: ElevatedButton(
            onPressed: () async {
              final time = await getTime();
              if (time == null) {
                return;
              } else {
                if (timeS == null || comTime(timeS, time)) {
                  setState(() {
                    timeE = time;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("End time has been set")));
                } else {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                              title: Text("Time Conflict",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold)),
                              content: Text(
                                  "End time can't be earlier than Start time",
                                  style: TextStyle(color: Colors.red)),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Close'),
                                )
                              ]));
                }
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder()),
            child: timeE == null
                ? Text(
                    "End",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  )
                : Text(timeE!.format(context),
                    style: TextStyle(color: Colors.white, fontSize: 17))),
      ),
    ]);
  }
}
