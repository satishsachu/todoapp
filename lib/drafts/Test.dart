import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // Root widget
        home: Center(
          child: Scaffold(body: neat()),
        ));
  }
}

class neat extends StatelessWidget {
  const neat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: ElevatedButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.fromLTRB(50, 55, 50, 55)),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () {
              print('Hello guys');
            },
            child: Text(
              'Logo',
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
        ),
      ),
    );
  }
}
