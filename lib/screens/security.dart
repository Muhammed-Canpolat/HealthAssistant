import 'package:flutter/material.dart';
import 'patient_relative.dart';
import 'reset_password.dart';

import 'delete_account.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Güvenlik')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // "Hasta Yakınlarım" kartı
          Card(
            elevation: 4, // Gölge derinliği (yüksekliği) artırıldı
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Köşeleri yuvarlat
            ),
            child: ListTile(
              leading: Icon(
                Icons.people,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text(
                'Hasta Yakınlarım',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // Hasta Yakınlarım sayfasına navigasyon
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PatientRelativePage()),
                );
              },
            ),
          ),
          const SizedBox(height: 10), // Kartlar arası boşluk
          // "Şifre Yenile" kartı
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              leading: Icon(
                Icons.lock_reset,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text(
                'Şifre Yenile',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // Şifre Yenile sayfasına navigasyon
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ResetPasswordPage()),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          // "Hesabı Kapat" kartı
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              leading: Icon(
                Icons.delete_forever,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text(
                'Hesabı Kapat',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // Hesabı Kapat sayfasına navigasyon
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DeleteAccountPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
