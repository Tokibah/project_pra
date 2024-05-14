import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_praq/FinalWorld/ticket.dart';
import 'package:project_praq/FinalWorld/ticket_create.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TicketPush extends StatelessWidget {
  const TicketPush({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => TicketList());
      },
    ));
  }
}

class TicketList extends StatefulWidget {
  TicketList({super.key});

  @override
  State<TicketList> createState() => _TicketListState();
}

class _TicketListState extends State<TicketList> {
  List<Ticket> ticketCard = [
    Ticket(name: "Jake", type: true, time: "22:40", seat: "AB"),
    Ticket(name: 'Lisa', type: false, time: "34:56", seat: "nothing")
  ];

  List<Ticket> filterTicket(bool type) {
    final filt = ticketCard.where((element) => element.type == type).toList();
    return filt;
  }

  void savedTicket() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final savedata =
        ticketCard.map((ticket) => jsonEncode(ticket.toJson())).toList();

    await prefs.setStringList("ticket", savedata);
  }

  void loadTicket() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final prefdata = prefs.getStringList("ticket");

    if (prefdata != null) {
      final loadata = prefdata
          .map((ticket) => Ticket.fromJson(jsonDecode(ticket)))
          .toList();
      setState(() {
        ticketCard = loadata;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadTicket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            SizedBox(height: 50),
            const Align(
                alignment: Alignment.topCenter,
                child: Text("TICKETS LIST",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
            SizedBox(height: 25),
            ElevatedButton(
                onPressed: () async {
                  Ticket newTicket = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => TicketCreate())));

                  setState(() {
                    ticketCard.add(newTicket);
                  });
                  savedTicket();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: const Text(
                  "Create new ticket",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
            SizedBox(height: 70),
            Text("Opening ceremony", style: TextStyle(fontSize: 25)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TicketCard(ticketFil: filterTicket(true)),
            ),
            Text("Closing ceremony", style: TextStyle(fontSize: 25)),
            TicketCard(ticketFil: filterTicket(false))
          ]),
        ),
      ),
    );
  }
}

class TicketCard extends StatelessWidget {
  const TicketCard({super.key, required this.ticketFil});

  final List<Ticket> ticketFil;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160 * ticketFil.length.toDouble(),
      width: 300,
      child: ListView.builder(
          itemCount: ticketFil.length,
          itemBuilder: ((context, index) {
            final card = ticketFil[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                color: Colors.orange,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(card.name, style: TextStyle(fontSize: 40)),
                      Text("${card.time}\n${card.seat}",
                          style: TextStyle(fontSize: 20))
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }
}
