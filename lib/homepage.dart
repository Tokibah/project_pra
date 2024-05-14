import 'package:flutter/material.dart';
import 'package:project_praq/FinalWorld/bottom_navi.dart';
import 'package:project_praq/LoginPage/loginpage.dart';
import 'package:project_praq/SimpleWidgetDrawer/simple_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
              onPressed: () async {
                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Login Successfull",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  backgroundColor: Color.fromARGB(255, 236, 162, 36),
                ));
              },
              icon: Icon(
                Icons.logout,
              ))
        ],
      ),
      drawer: DrawerJek(),
      body: const SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 70),
          TextJek(),
          Divider(
            indent: 40,
            endIndent: 40,
            thickness: 10,
          ),
          ContainerJek(),
          Divider(
            height: 80,
            thickness: 5,
          ),
          TextFieldJek(),
          ButtonJek(),
          Gridjek(),
        ]),
      ),
    );
  }
}

class TextJek extends StatelessWidget {
  const TextJek({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Hello",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 25,
                  decoration: TextDecoration.overline,
                  decorationColor: Colors.white,
                  fontWeight: FontWeight.w300)),
          Text("Hello",
              style: TextStyle(
                  fontSize: 30,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.white,
                  decorationThickness: 2,
                  fontWeight: FontWeight.bold))
        ]);
  }
}

class ContainerJek extends StatelessWidget {
  const ContainerJek({super.key});

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            height: 150,
            width: 150,
            transform: Matrix4.rotationZ(0.20),
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 236, 162, 36)),
            child: const Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "BOX",
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Colors.orange, Colors.grey],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(color: Colors.black, offset: Offset(15, 15))
                ]),
            child: const Stack(
              children: [
                Positioned(right: 30, top: 20, child: Icon(Icons.help))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TextFieldJek extends StatelessWidget {
  const TextFieldJek({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(children: [
        TextFormField(
          style: const TextStyle(color: Colors.purple),
          decoration: const InputDecoration(
              hintText: "Type something...",
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.keyboard),
              prefixIconColor: Colors.purple,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange)),
              filled: true),
          cursorColor: Colors.orange,
        ),
        const TextField(
          decoration: InputDecoration(
              icon: Icon(Icons.keyboard),
              iconColor: Colors.white,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusColor: Colors.orange),
        )
      ]),
    );
  }
}

class DrawerJek extends StatelessWidget {
  const DrawerJek({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 236, 162, 36), //DrawerHeader()
      child: Column(children: [
        UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(255, 90, 6, 104)),
            accountName: Text("THIS==DRAWER"),
            accountEmail: Text("wwww@world.com"),
            currentAccountPicture: IconButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage())),
                icon: Icon(Icons.home))),
        ListTile(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => SimpleWidget())),
            title: Text("SIMPLE", style: TextStyle(fontSize: 25)),
            leading: Icon(Icons.settings_backup_restore)),
        Divider(),
        ListTile(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => WorldBottomNavi())),
            leading: Icon(Icons.map),
            title: Text("World Final", style: TextStyle(fontSize: 25))),
        Divider(),
      ]),
    );
  }
}

class Gridjek extends StatelessWidget {
  const Gridjek({super.key});

  @override
  Widget build(BuildContext context) {
    int gridtime = 15;
    return Container(
      height: gridtime * 20,
      child: GridView.builder(
          itemCount: 10,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
          itemBuilder: ((context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.orange,
                ),
              ))),
    );
  }
}

class ButtonJek extends StatefulWidget {
  const ButtonJek({super.key});

  @override
  State<ButtonJek> createState() => _ButtonJekState();
}

class _ButtonJekState extends State<ButtonJek> {
  bool checkB = false;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Checkbox(
          activeColor: Colors.orange,
          value: checkB,
          onChanged: (value) {
            setState(() {
              checkB = value!;
            });
          })
    ]);
  }
}
