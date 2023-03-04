import 'package:flutter/material.dart';

class Type3 extends StatefulWidget {
  const Type3({super.key});

  @override
  State<Type3> createState() => _Type3State();
}

class _Type3State extends State<Type3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
    ));
  }
}
