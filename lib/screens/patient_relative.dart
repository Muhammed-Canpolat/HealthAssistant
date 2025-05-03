import 'package:flutter/material.dart';

class PatientRelativePage extends StatefulWidget {
  const PatientRelativePage({super.key});

  @override
  State<PatientRelativePage> createState() => _PatientRelativePageState();
}

class _PatientRelativePageState extends State<PatientRelativePage> {
  List<Map<String, String>> relatives = [
    {'name': 'Dilara Karaca', 'phone': '05*********'},
    {'name': 'Muhammed Canpolat', 'phone': '05*********'},
  ];

  bool accessPermission = false;
  bool locationPermission = false;

  void _addRelative() {
    String newName = '';
    String newPhone = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Yeni Hasta Yakını Ekle'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'İsim'),
                onChanged: (value) => newName = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Telefon Numarası'),
                keyboardType: TextInputType.phone,
                onChanged: (value) => newPhone = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('İptal'),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: Text('Ekle'),
              onPressed: () {
                if (newName.trim().isNotEmpty && newPhone.trim().isNotEmpty) {
                  setState(() {
                    relatives.add({'name': newName, 'phone': newPhone});
                  });
                }
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _removeRelative(int index) {
    setState(() {
      relatives.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF4F4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'Hasta Yakınlarım',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: _addRelative,
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('images/arka_plan.png', fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: relatives.length,
                    separatorBuilder:
                        (context, index) =>
                            Divider(height: 1, color: Colors.grey[300]),
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          color: Colors.red,
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (direction) => _removeRelative(index),
                        child: ListTile(
                          title: Text(
                            relatives[index]['name'] ?? '',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(relatives[index]['phone'] ?? ''),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Divider(thickness: 1, color: Colors.grey[400]),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SwitchListTile(
                        title: const Text(
                          'Kayıtlı yakınlarıma erişim izni ver.',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        value: accessPermission,
                        onChanged:
                            (value) => setState(() => accessPermission = value),
                      ),
                      SwitchListTile(
                        title: const Text(
                          'Kayıtlı yakınlarıma konum erişim izni ver.',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        value: locationPermission,
                        onChanged:
                            (value) =>
                                setState(() => locationPermission = value),
                      ),
                    ],
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
