import 'package:flutter/material.dart';
import 'button_.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback oncancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onsave,
      required this.oncancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.red,
      content: Container(
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: controller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "add a new Task",
              ),
            ),
            //cancel save
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Mybutton(
                  text: "save",
                  onpressed: onsave,
                ),
                Mybutton(
                  text: "cancel",
                  onpressed: oncancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
