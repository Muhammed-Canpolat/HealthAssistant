import 'package:flutter/material.dart';

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

  String? selectedDisease;
  String? selectedBloodType;
  String? selectedGender;

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
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
                        onPressed: () {
                          Navigator.pushNamed(context, '/registerRelative');
                        },
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
                  'Hastalıklarınızı Ekleyiniz',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: selectedDisease,
                items:
                    ["Şeker", "Tansiyon", "Kalp", "Astım"].map((disease) {
                      return DropdownMenuItem(
                        value: disease,
                        child: Text(
                          disease,
                          style: const TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 14,
                          ),
                        ),
                      );
                    }).toList(),
                onChanged: (value) => setState(() => selectedDisease = value),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
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
                          [
                            "A+",
                            "A-",
                            "B+",
                            "B-",
                            "AB+",
                            "AB-",
                            "0+",
                            "0-",
                          ].map((type) {
                            return DropdownMenuItem(
                              value: type,
                              child: Text(
                                type,
                                style: const TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 14,
                                ),
                              ),
                            );
                          }).toList(),
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
                          ["Kadın", "Erkek"].map((gender) {
                            return DropdownMenuItem(
                              value: gender,
                              child: Text(
                                gender,
                                style: const TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 14,
                                ),
                              ),
                            );
                          }).toList(),
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
                onTap: () {},
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
