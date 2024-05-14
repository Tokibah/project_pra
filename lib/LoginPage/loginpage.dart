import 'package:flutter/material.dart';
import 'package:project_praq/LoginPage/forgotpass.dart';
import 'package:project_praq/LoginPage/user.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.orange, const Color.fromARGB(255, 255, 157, 190)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 600,
              width: 350,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 90, 6, 104),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: const Color.fromARGB(255, 44, 2, 51),
                        offset: Offset(10, 10))
                  ]),
              child: LogInContent(),
            ),
          ),
        ),
      ),
    );
  }
}

class LogInContent extends StatefulWidget {
  const LogInContent({super.key});

  @override
  State<LogInContent> createState() => _LogInContentState();
}

class _LogInContentState extends State<LogInContent> {
  final key = GlobalKey<FormState>();

  final _usernameControl = TextEditingController();
  final _passwordControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("L O G I N",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35)),
          SizedBox(height: 30),
          SizedBox(
            width: 300,
            child: Column(children: [
              LoginForm(control: _usernameControl, type: "Username"),
              LoginForm(control: _passwordControl, type: "Password")
            ]),
          ),
          ElevatedButton(
              onPressed: () async {
                final validUser = await verifyUser(_usernameControl.text);
                final validPass = await verifyPassword(_passwordControl.text);

                if (key.currentState!.validate()) {
                  if (validUser == false) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Invalid User")));
                  } else if (validPass == false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Wrong Password")));
                  } else if (validUser && validPass) {
                    Navigator.pop(context);
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                fixedSize: Size(300, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordPage()));
              },
              child: Text(
                "Forgot password?",
                style: TextStyle(color: Colors.orange),
              ))
        ],
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key, required this.control, required this.type});

  final TextEditingController control;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$type",
          style: TextStyle(fontSize: 15),
        ),
        TextFormField(
          controller: control,
          validator: (value) {
            if (value!.isEmpty) {
              return "Dont leave it empty";
            } else {
              return null;
            }
          },
          obscureText: type == "Password" ? true : false,
          style: TextStyle(color: Colors.orange),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
                borderRadius: BorderRadius.circular(20)),
            hintText: "type your $type..",
            hintStyle: TextStyle(color: Colors.grey),
            errorStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            filled: true,
            fillColor: Colors.black,
          ),
          cursorColor: Colors.orange,
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
