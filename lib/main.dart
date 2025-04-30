import 'package:flutter/material.dart';
import 'screens/login_email_screen.dart';
import 'screens/login_phone_screen.dart';
import 'screens/login_sms_screen.dart';
import 'screens/register_patient_screen.dart';
import 'screens/register_relative_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/forgot_password_verify_screen.dart';
import 'screens/forgot_password_reset_screen.dart';

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
      },
    );
  }
}
