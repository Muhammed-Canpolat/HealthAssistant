import 'package:flutter/material.dart';

class LoginSmsScreen extends StatelessWidget {
  const LoginSmsScreen({super.key});

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
            Navigator.pushNamed(context, '/loginPhone');
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Kronik Hasta Takip',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    'images/adsiz_tasarim_14.png',
                    width: 220,
                    height: 220,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('images/koyu_rectangle.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'SMS',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(4, (index) {
                          return Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: TextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                decoration: const InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFCDE7DA),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 3,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 80,
                            vertical: 12,
                          ),
                          child: Text('SMS Yenile'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFCDE7DA),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: const Center(
                            child: Text(
                              'Giriş Yap',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
