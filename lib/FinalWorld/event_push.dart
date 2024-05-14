import 'package:flutter/material.dart';
import 'package:project_praq/homepage.dart';

class EventPush extends StatelessWidget {
  const EventPush({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Navigator(onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) => const EventTop());
        }),
        appBar: AppBar(),
        drawer: DrawerJek());
  }
}

class EventTop extends StatefulWidget {
  const EventTop({super.key});

  @override
  State<EventTop> createState() => _EventTopState();
}

class _EventTopState extends State<EventTop> {
  List<bool> filter = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(children: [
            const Align(
                alignment: Alignment.topCenter,
                child: Text("EVENTS LIST",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
            ToggleButtons(
                borderColor: Colors.white,
                borderRadius: BorderRadius.circular(20),
                selectedColor: Colors.white,
                fillColor: Colors.orange,
                color: Colors.white,
                isSelected: filter,
                onPressed: (index) {
                  setState(() {
                    for (int loop = 0; loop < filter.length; loop++) {
                      if (loop == index) {
                        filter[loop] = true;
                      } else {
                        filter[loop] = false;
                      }
                    }
                  });
                },
                children: const [
                  Text("All", style: TextStyle(fontSize: 18)),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Unread", style: TextStyle(fontSize: 18)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Read", style: TextStyle(fontSize: 18)),
                  )
                ]),
            SizedBox(height: 30),
            EventList(),
          ]),
        ),
      ),
    );
  }
}

class EventList extends StatelessWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context) {
    int itemQuan = 10;

    void biggerPic() {
      List<String> picpath = ["Pic1", "Pic2", "Pic3"];

      showDialog(
          context: context,
          builder: (context) => Dialog(
                child: Container(
                    height: 400,
                    width: 400,
                    child: PageView.builder(
                        itemCount: picpath.length,
                        controller: PageController(initialPage: 1),
                        itemBuilder: (context, index) => Column(children: [
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Center(
                                    child: Text(
                                  picpath[index],
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30),
                                )),
                              ),
                              Icon(Icons.double_arrow, color: Colors.black)
                            ]))),
              ));
    }

    return Container(
      height: 170 * itemQuan.toDouble(),
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: itemQuan,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => biggerPic(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    color: Colors.white,
                    height: 150,
                    child: Row(children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 130, width: 130, color: Colors.grey)),
                      Text("Title", style: TextStyle(color: Colors.orange))
                    ])),
              ),
            );
          }),
    );
  }
}
