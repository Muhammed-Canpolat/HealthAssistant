import 'package:flutter/material.dart';

class PatientsProfile extends StatefulWidget {
  @override
  _PatientsProfileState createState() => _PatientsProfileState();
}

class _PatientsProfileState extends State<PatientsProfile> {
  bool isEditing = false;

  final TextEditingController nameController = TextEditingController(
    text: "Sudenaz Kartal",
  );
  final TextEditingController phoneController = TextEditingController(
    text: "05*********",
  );
  final TextEditingController emailController = TextEditingController(
    text: "sudenazkartal55@gmail.com",
  );

  final FocusNode nameFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();

  void enableEditing(FocusNode focusNode) {
    setState(() => isEditing = true);
    Future.delayed(Duration(milliseconds: 100), () {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  @override
  void dispose() {
    nameFocus.dispose();
    phoneFocus.dispose();
    emailFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Profil',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('images/arka_plan.png', fit: BoxFit.cover),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, kToolbarHeight + 32, 16, 16),
            child: Column(
              children: [
                _buildEditableTile("Ad-Soyad", nameController, nameFocus),
                _buildEditableTile(
                  "Telefon Numarası",
                  phoneController,
                  phoneFocus,
                ),
                _buildEditableTile("Email", emailController, emailFocus),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditableTile(
    String label,
    TextEditingController controller,
    FocusNode focusNode,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: controller,
                  focusNode: focusNode,
                  enabled: isEditing,
                  decoration: const InputDecoration.collapsed(hintText: ""),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => enableEditing(focusNode),
            child: Icon(Icons.edit, size: 20, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
