import 'package:flutter/material.dart';

class DeviceConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cihaz Bağlantısı'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text(
          'Bağlı Cihazlar',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
