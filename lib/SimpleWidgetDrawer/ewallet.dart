import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//regExp(r'^[^@]*@.*$')

class EwalletJek extends StatefulWidget {
  const EwalletJek({super.key});

  @override
  State<EwalletJek> createState() => _EwalletJekState();
}

class _EwalletJekState extends State<EwalletJek> {
  TextEditingController AmountCon = TextEditingController();

  void formatInput(String input) {
    if (input == "") {
      setState(() {
        AmountCon.text = "RM0.00";
      });
      return;
    }

    String filInput = input.replaceAll(RegExp(r'[^0-9]'), "");

    if (filInput.length > 3) {
      filInput = filInput.replaceFirst('0', "");
    } else if (filInput.length < 3) {
      filInput = "0${filInput.padLeft(2, '0')}";
    }
    filInput =
        "${filInput.substring(0, filInput.length - 2)}.${filInput.substring(filInput.length - 2)}";

    AmountCon.text = "RM$filInput";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AmountCon.text = "RM0.00";
    formatInput(AmountCon.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Type in amount..",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
                width: 250,
                child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                    ],
                    controller: AmountCon,
                    onChanged: formatInput,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 220, 138, 15)))),
          ],
        ),
      ),
    );
  }
}

/*   bool formatValidation(String value) {
    if (!value.startsWith('RM ')) {
      return false;
    } else if (value.length - value.lastIndexOf('.') != 3) {
      final num = value.lastIndexOf('.');
      return false;
    }
    String testValue = value.replaceFirst("RM", "");
    testValue = testValue.replaceFirst(".", "");
    testValue = testValue.replaceAll(" ", "");
    if (int.tryParse(testValue) == null) {
      return false;
    }

    return true;
  } */