import 'package:flutter/material.dart';

class DeviceConnection extends StatefulWidget {
  @override
  _DeviceConnectionState createState() => _DeviceConnectionState();
}

class _DeviceConnectionState extends State<DeviceConnection> {
  bool isBluetoothOn = true;

  void _toggleBluetooth(bool value) {
    setState(() {
      isBluetoothOn = value;
    });

    final message =
        value ? "Bağlantı kuruluyor..." : "Cihaz bağlantısı kesilmiştir.";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.teal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF4F4),
      appBar: AppBar(
        title: const Text(
          'Cihaz Bağlantısı',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('images/arka_plan.png', fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Bağlı Cihazlar',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.bluetooth, color: Colors.teal),
                    title: const Text(
                      'PazuBandHC-05 Bluetooth',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Switch(
                      value: isBluetoothOn,
                      activeColor: Colors.teal,
                      onChanged: _toggleBluetooth,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
