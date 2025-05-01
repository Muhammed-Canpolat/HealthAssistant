import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;

  TextEditingController nameController = TextEditingController(
    text: "Sudenaz Kartal",
  );
  TextEditingController phoneController = TextEditingController(
    text: "05*********",
  );
  TextEditingController emailController = TextEditingController(
    text: "sudenazkartal55@gmail.com",
  );
  TextEditingController diseaseController = TextEditingController(
    text: "Tansiyon\nDiyabet",
  );

  FocusNode nameFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode diseaseFocus = FocusNode();

  @override
  void dispose() {
    nameFocus.dispose();
    phoneFocus.dispose();
    emailFocus.dispose();
    diseaseFocus.dispose();
    super.dispose();
  }

  void enableEditing(FocusNode focusNode) {
    setState(() => isEditing = true);
    Future.delayed(Duration(milliseconds: 100), () {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'Profil',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: const Color(0xFFEAF4F4),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildEditableTile("Ad-Soyad", nameController, nameFocus),
            _buildEditableTile("Telefon Numarası", phoneController, phoneFocus),
            _buildEditableTile("Email", emailController, emailFocus),
            _buildEditableTile(
              "Kayıtlı Hastalıklar",
              diseaseController,
              diseaseFocus,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableTile(
    String label,
    TextEditingController controller,
    FocusNode focusNode, {
    int maxLines = 1,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: controller,
                  focusNode: focusNode,
                  enabled: isEditing,
                  maxLines: maxLines,
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
