import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscureOld = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  void _toggleVisibility(String field) {
    setState(() {
      if (field == 'old') _obscureOld = !_obscureOld;
      if (field == 'new') _obscureNew = !_obscureNew;
      if (field == 'confirm') _obscureConfirm = !_obscureConfirm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Şifre Yenile"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/arka_plan.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 80), // Added padding for AppBar
                _buildPasswordField(
                  label: "Eski Şifre",
                  controller: _oldPasswordController,
                  obscure: _obscureOld,
                  toggle: () => _toggleVisibility('old'),
                ),
                const SizedBox(height: 20),
                _buildPasswordField(
                  label: "Yeni Şifre",
                  controller: _newPasswordController,
                  obscure: _obscureNew,
                  toggle: () => _toggleVisibility('new'),
                ),
                const SizedBox(height: 20),
                _buildPasswordField(
                  label: "Yeni Şifre (Tekrar)",
                  controller: _confirmPasswordController,
                  obscure: _obscureConfirm,
                  toggle: () => _toggleVisibility('confirm'),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Şifre güncellendi.")),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, // Yazı rengi
                    backgroundColor: Color(0xFF305058), // Buton arka planı
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: const Text(
                    "Şifreyi Güncelle",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required bool obscure,
    required VoidCallback toggle,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        fillColor: Colors.white,
        filled: true,
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
          onPressed: toggle,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Bu alan boş bırakılamaz';
        if (label.contains("Tekrar") && value != _newPasswordController.text) {
          return 'Şifreler eşleşmiyor';
        }
        return null;
      },
    );
  }
}
