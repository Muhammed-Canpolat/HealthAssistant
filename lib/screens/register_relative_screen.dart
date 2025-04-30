import 'package:flutter/material.dart';

class RegisterRelativeScreen extends StatefulWidget {
  const RegisterRelativeScreen({super.key});

  @override
  State<RegisterRelativeScreen> createState() => _RegisterRelativeScreenState();
}

class _RegisterRelativeScreenState extends State<RegisterRelativeScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController patientCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFF3EC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDFF3EC),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Kronik Hasta Takip',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    'images/adsiz_tasarim_14.png',
                    width: 120,
                    height: 120,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 8),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/registerPatient');
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                          ),
                          child: const Text(
                            'Hasta',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black87,
                          ),
                          child: const Text(
                            'Hasta Yakını',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                buildInputField(label: 'Ad', controller: nameController),
                buildInputField(label: 'Soyad', controller: surnameController),
                buildInputField(label: 'E-posta', controller: emailController),
                buildInputField(
                  label: 'Telefon Numarası',
                  controller: phoneController,
                ),
                buildInputField(
                  label: 'Şifre',
                  controller: passwordController,
                  obscureText: true,
                ),
                buildInputField(
                  label: 'Şifre Tekrar',
                  controller: confirmPasswordController,
                  obscureText: true,
                ),
                buildInputField(
                  label: 'Hasta Bağlantı Kodu',
                  controller: patientCodeController,
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset('images/frame_60.png', width: 120),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputField({
    required String label,
    required TextEditingController controller,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(
          fontFamily: 'Arial',
          fontSize: 14,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.black,
            fontFamily: 'Arial',
            fontSize: 14,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
