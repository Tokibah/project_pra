import 'package:flutter/material.dart';
import 'package:project_praq/FinalWorld/event_push.dart';
import 'package:project_praq/FinalWorld/ticket_push.dart';

class WorldBottomNavi extends StatefulWidget {
  const WorldBottomNavi({super.key});

  @override
  State<WorldBottomNavi> createState() => _WorldBottomNaviState();
}

class _WorldBottomNaviState extends State<WorldBottomNavi> {
  int bottomIndex = 0;

  final List<Widget> _page = const [EventPush(), TicketPush()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: bottomIndex,
        children: _page,
      ),
      bottomNavigationBar: Container(
        height: 75,
        child: BottomNavigationBar(
          currentIndex: bottomIndex,
          onTap: (index) {
            setState(() {
              bottomIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.newspaper), label: "EVENT"),
            BottomNavigationBarItem(
                icon: Icon(Icons.airplane_ticket), label: "TICKETS")
          ],
        ),
      ),
    );
  }
}
