import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Yardım'), backgroundColor: Colors.teal),
      body: Center(
        child: Text(
          'Yardım ve Destek',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
