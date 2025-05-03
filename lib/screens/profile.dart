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

  List<String> allDiseases = ['Tansiyon', 'Diyabet', 'Astım', 'Kalp'];
  Set<String> selectedDiseases = {'Tansiyon', 'Diyabet'};

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

  void showDiseaseSelectionPanel() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Hastalık Seçimi',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...allDiseases.map((disease) {
                    return CheckboxListTile(
                      title: Text(disease),
                      value: selectedDiseases.contains(disease),
                      onChanged: (bool? value) {
                        setModalState(() {
                          if (value == true) {
                            selectedDiseases.add(disease);
                          } else {
                            selectedDiseases.remove(disease);
                          }
                        });
                      },
                    );
                  }).toList(),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      diseaseController.text = selectedDiseases.join('\n');
                      Navigator.pop(context);
                    },
                    child: const Text("Kaydet"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
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
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('images/arka_plan.png', fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildEditableTile("Ad-Soyad", nameController, nameFocus),
                _buildEditableTile(
                  "Telefon Numarası",
                  phoneController,
                  phoneFocus,
                ),
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
        ],
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
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: controller,
                  focusNode: focusNode,
                  enabled: isEditing && label != "Kayıtlı Hastalıklar",
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
            onTap: () {
              if (label == "Kayıtlı Hastalıklar") {
                showDiseaseSelectionPanel();
              } else {
                enableEditing(focusNode);
              }
            },
            child: Icon(Icons.edit, size: 20, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
