import 'package:flutter/material.dart';

class ForgotVerifyScreen extends StatelessWidget {
  const ForgotVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController smsCodeController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFDFF3EC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Text(
              'SMS Doğrulama',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: smsCodeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'SMS Kodu',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/resetPassword');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFCDE7DA),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Center(
                child: Text(
                  'Devam Et',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
