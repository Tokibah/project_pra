import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_praq/LoginPage/user.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange, Color.fromARGB(255, 255, 157, 190)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(),
        body: FutureBuilder<List<User>>(
            future: fetchJson(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else {
                final loginData = snapshot.data!;
                return Stack(children: [
                  Positioned(
                      left: 25,
                      top: 90,
                      child: Container(
                          width: 300,
                          height: 250,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 90, 6, 104),
                              boxShadow: [BoxShadow(offset: Offset(15, 15))]),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: loginData.map((user) {
                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "username: ${user.username} \n password: ${user.password}",
                                      style: TextStyle(fontSize: 20),
                                    ));
                              }).toList()))),
                  Positioned(
                      bottom: 300,
                      right: 45,
                      child: Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            boxShadow: [BoxShadow(offset: Offset(10, 10))]),
                      ))
                ]);
              }
            }),
      ),
    );
  }
}
