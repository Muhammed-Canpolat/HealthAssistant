import 'dart:math';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class RegisterPatientScreen extends StatefulWidget {
  const RegisterPatientScreen({super.key});

  @override
  State<RegisterPatientScreen> createState() => _RegisterPatientScreenState();
}

class _RegisterPatientScreenState extends State<RegisterPatientScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  String? selectedBloodType;
  String? selectedGender;
  List<String> selectedDiseases = [];

  final List<String> diseaseList = [
    "KOAH",
    "Panik Atak",
    "Uyku apnesi ve Uyku Bozuklukları",
    "Diyabet",
    "Tansiyon",
    "Kalp",
    "Astım",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFF3EC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Kronik Hasta Takip',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  'images/adsiz_tasarim_14.png',
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black87,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Hasta',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed:
                            () => Navigator.pushNamed(
                              context,
                              '/registerRelative',
                            ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Hasta Yakını',
                          style: TextStyle(color: Colors.black87),
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
                label: 'Şifre Tekrarı',
                controller: confirmPasswordController,
                obscureText: true,
              ),
              const SizedBox(height: 16),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hastalıklarınızı Seçiniz',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              MultiSelectDialogField(
                items: diseaseList.map((e) => MultiSelectItem(e, e)).toList(),
                title: const Text("Hastalıklar"),
                buttonText: const Text("Hastalık Seç"),
                onConfirm:
                    (values) => setState(
                      () => selectedDiseases = values.cast<String>(),
                    ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: buildInputField(
                      label: 'Kg',
                      controller: weightController,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: buildInputField(
                      label: 'cm',
                      controller: heightController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedBloodType,
                      hint: const Text("Kan Grubu"),
                      items:
                          ["A+", "A-", "B+", "B-", "AB+", "AB-", "0+", "0-"]
                              .map(
                                (type) => DropdownMenuItem(
                                  value: type,
                                  child: Text(type),
                                ),
                              )
                              .toList(),
                      onChanged:
                          (value) => setState(() => selectedBloodType = value),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedGender,
                      hint: const Text("Cinsiyet"),
                      items:
                          ["Kadın", "Erkek"]
                              .map(
                                (gender) => DropdownMenuItem(
                                  value: gender,
                                  child: Text(gender),
                                ),
                              )
                              .toList(),
                      onChanged:
                          (value) => setState(() => selectedGender = value),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              GestureDetector(
                onTap: () async {
                  final name = nameController.text.trim();
                  final surname = surnameController.text.trim();
                  final email = emailController.text.trim();
                  final phone = phoneController.text.trim();
                  final password = passwordController.text.trim();
                  final confirmPassword = confirmPasswordController.text.trim();
                  final weight = weightController.text.trim();
                  final height = heightController.text.trim();

                  if (password != confirmPassword) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Şifreler uyuşmuyor!")),
                    );
                    return;
                  }

                  if (password.length < 6) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Şifre en az 6 karakter olmalı."),
                      ),
                    );
                    return;
                  }

                  try {
                    final userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                    final uid = userCredential.user!.uid;

                    String generatePatientCode() {
                      const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
                      final rand = Random();
                      return 'HT' +
                          List.generate(
                            4,
                            (index) => chars[rand.nextInt(chars.length)],
                          ).join();
                    }

                    final patientCode = generatePatientCode();

                    await FirebaseFirestore.instance
                        .collection('patients')
                        .doc(uid)
                        .set({
                          'uid': uid,
                          'name': name,
                          'surname': surname,
                          'email': email,
                          'phone': phone,
                          'weight': weight,
                          'height': height,
                          'gender': selectedGender,
                          'bloodType': selectedBloodType,
                          'diseases': selectedDiseases,
                          'patientCode': patientCode,
                          'role': 'patient', // 🔐 Giriş ekranı için şart
                          'createdAt': Timestamp.now(),
                        });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Kayıt başarılı!")),
                    );
                    Navigator.pushReplacementNamed(context, '/loginEmail');
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Kayıt sırasında hata oluştu: ${e.toString()}",
                        ),
                      ),
                    );
                  }
                },
                child: Image.asset('images/frame_60.png', width: 120),
              ),
            ],
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
        decoration: InputDecoration(
          labelText: label,
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
