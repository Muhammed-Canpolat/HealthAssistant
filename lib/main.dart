import 'package:flutter/material.dart';
import 'screens/login_email_screen.dart';
import 'screens/login_phone_screen.dart';
import 'screens/login_sms_screen.dart';
import 'screens/register_patient_screen.dart';
import 'screens/register_relative_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/forgot_password_verify_screen.dart';
import 'screens/forgot_password_reset_screen.dart';
import 'screens/home_page.dart';
import 'screens/settings.dart';
import 'screens/emergency.dart';

void main() {
  runApp(const KronikHastaTakipApp());
}

class KronikHastaTakipApp extends StatelessWidget {
  const KronikHastaTakipApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kronik Hasta Takip',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFDFF3EC),
      ),
      initialRoute: '/loginEmail',
      routes: {
        '/loginEmail': (context) => const LoginEmailScreen(),
        '/loginPhone': (context) => const LoginPhoneScreen(),
        '/loginSms': (context) => const LoginSmsScreen(),
        '/registerPatient': (context) => const RegisterPatientScreen(),
        '/registerRelative': (context) => const RegisterRelativeScreen(),
        '/forgotPassword': (context) => const ForgotPasswordScreen(),
        '/forgotVerify': (context) => const ForgotVerifyScreen(),
        '/resetPassword': (context) => const ForgotResetScreen(),
        '/home': (context) => AltNavigasyon(),
      },
    );
  }
}

class AltNavigasyon extends StatefulWidget {
  @override
  _AltNavigasyonState createState() => _AltNavigasyonState();
}

class _AltNavigasyonState extends State<AltNavigasyon> {
  int _seciliIndex = 0;

  final List<Widget> _sayfalar = [HomePage(), Settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _sayfalar[_seciliIndex],

      floatingActionButton: SizedBox(
        width: 80,
        height: 80,
        child: FloatingActionButton(
          backgroundColor: Colors.red,
          shape: CircleBorder(),
          child: Text(
            "ACİL",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Emergency()),
            );
          },
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF18202B),
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  color:
                      _seciliIndex == 0
                          ? const Color.fromARGB(255, 235, 233, 233)
                          : Colors.white,
                  size: 45,
                ),
                onPressed: () => setState(() => _seciliIndex = 0),
              ),
              const SizedBox(width: 40), // ACİL buton boşluğu
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: _seciliIndex == 1 ? Colors.red : Colors.white,
                  size: 45,
                ),
                onPressed: () => setState(() => _seciliIndex = 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
