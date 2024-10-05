import 'package:flutter/material.dart';
import 'contact.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      title: 'Contacts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.grey[800]),
      home: const Contact(),
    ));
  }
}
