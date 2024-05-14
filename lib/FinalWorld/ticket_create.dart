import 'dart:math';
import 'package:flutter/material.dart';
import 'package:project_praq/FinalWorld/ticket.dart';

class TicketCreate extends StatefulWidget {
  const TicketCreate({super.key});

  @override
  State<TicketCreate> createState() => _TicketCreateState();
}

class _TicketCreateState extends State<TicketCreate> {
  bool? intype;
  TextEditingController inName = TextEditingController();
  bool nultype = true;
  bool nulname = true;

  String getTime() {
    DateTime date = DateTime.now();
    String sdate =
        "${date.day}-${date.month}-${date.year} ${date.hour}:${date.minute}";
    return sdate;
  }

  String getSeat() {
    final random = Random();
    final charac = ['A', 'B', 'C'];

    final ranChar = charac[random.nextInt(charac.length)];
    final numChar = random.nextInt(9) + 1;
    final nrow = random.nextInt(9) + 1;
    final ncol = random.nextInt(9) + 1;

    String seat = "$ranChar$numChar Row$nrow Column$ncol";
    return seat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: nultype ? Colors.orange : Colors.red),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      dropdownColor: Colors.orange,
                      hint: Text("Choose ticket type..",
                          style: TextStyle(color: Colors.grey)),
                      value: intype,
                      items: const [
                        DropdownMenuItem(
                            value: true,
                            child: Text("Opening Ceremony Ticket",
                                style: TextStyle(color: Colors.white))),
                        DropdownMenuItem(
                            value: false,
                            child: Text("Closing Ceremony Ticket",
                                style: TextStyle(color: Colors.white)))
                      ],
                      onChanged: (value) {
                        setState(() {
                          intype = value;
                        });
                      },
                    ))),
            SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Enter your name..",
                        hintStyle: TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: nulname ? Colors.purple : Colors.red)),
                        fillColor: Colors.black,
                        filled: true),
                    controller: inName,
                  ),
                )),
            ElevatedButton(
                onPressed: () {
                  if (intype == null || inName.text.isEmpty) {
                    setState(() {
                      if (intype == null) {
                        nultype = false;
                      }
                      if (inName.text.isEmpty) {
                        nulname = false;
                      } else {
                        nulname = true;
                      }
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Please fill in the form properly")));
                    return;
                  } else {
                    Ticket newTick = Ticket(
                        name: inName.text,
                        type: intype!,
                        time: getTime(),
                        seat: getSeat());
                    Navigator.pop(context, newTick);
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: Text(
                  "CREATE",
                  style: TextStyle(color: Colors.white),
                )),
          ]),
        ));
  }
}
