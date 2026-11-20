import 'package:material_ui/material_ui.dart';

import 'app_bottom_navigation.dart';
import 'informasi_screen.dart';

class SayaScreen extends StatefulWidget {
  const SayaScreen({super.key});

  @override
  State<SayaScreen> createState() => _SayaScreenState();
}

class _SayaScreenState extends State<SayaScreen> {
  static const Color teal = Color(0xFF5B8E8B);
  static const Color background = Color(0xFFEEEEEE);
  static const Color blue = Color(0xFF45A9E0);

  bool isEditing = false;

  final namaController = TextEditingController(text: 'Hafidh Tedi Setiawan');
  final nikController = TextEditingController(text: '3216182391236');
  final teleponController = TextEditingController(text: '089648354570');
  final alamatController = TextEditingController(
    text: 'Perum Graha Pratama Permai Blok C3',
  );

  @override
  void dispose() {
    namaController.dispose();
    nikController.dispose();
    teleponController.dispose();
    alamatController.dispose();
    super.dispose();
  }

  Widget labelField(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 9, bottom: 4),
      child: Text(
        label,
        style: const TextStyle(fontSize: 10, color: Colors.black),
      ),
    );
  }

  Widget profileField({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
    bool enabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelField(label),
        TextField(
          controller: controller,
          enabled: enabled,
          maxLines: maxLines,
          style: const TextStyle(fontSize: 12),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 11,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
          ),
        ),
      ],
    );
  }

  Widget actionButton({
    required String text,
    required VoidCallback onPressed,
    Color color = blue,
    Color textColor = Colors.white,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 37,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void simpanPerubahan() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
          content: const SizedBox(
            width: 280,
            child: Text(
              'Perubahan telah disimpan!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(dialogContext);
                  setState(() {
                    isEditing = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Oke'),
              ),
            ),
          ],
        );
      },
    );
  }

  void batalEdit() {
    setState(() {
      isEditing = false;
    });
  }

  void bukaMenu(String menu) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('$menu akan segera tersedia.')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: isEditing ? 188 : 225,
              color: teal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isEditing ? 'Akun Saya' : 'Akun Saya',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: isEditing ? 105 : 132,
                    height: isEditing ? 105 : 132,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFDCE6F8),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      'assets/images/profile.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.person, size: 90, color: teal);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    profileField(
                      label: 'Nama',
                      controller: namaController,
                      enabled: isEditing,
                    ),
                    const SizedBox(height: 10),

                    if (isEditing) ...[
                      profileField(label: 'NIK', controller: nikController),
                      const SizedBox(height: 10),
                    ],

                    profileField(
                      label: 'No Telepon',
                      controller: teleponController,
                      enabled: isEditing,
                    ),
                    const SizedBox(height: 10),
                    profileField(
                      label: 'Alamat',
                      controller: alamatController,
                      maxLines: isEditing ? 4 : 1,
                      enabled: isEditing,
                    ),
                    const SizedBox(height: 10),

                    if (isEditing) ...[
                      InkWell(
                        onTap: () => bukaMenu('Ubah Password'),
                        child: const Text(
                          'Ubah Password',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      actionButton(
                        text: 'Simpan Perubahan',
                        onPressed: simpanPerubahan,
                      ),
                      const SizedBox(height: 8),
                      actionButton(
                        text: 'Batal',
                        color: Colors.grey,
                        onPressed: batalEdit,
                      ),
                    ] else ...[
                      const SizedBox(height: 15),
                      actionButton(
                        text: 'Edit Profil',
                        onPressed: () {
                          setState(() {
                            isEditing = true;
                          });
                        },
                      ),
                      const SizedBox(height: 28),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () => bukaMenu('Log out'),
                          child: const Text(
                            'Log out',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigation(
        selectedIndex: 4,
        onTap: (index) {
          if (index == 0 || index == 1) {
            Navigator.pop(context);
          } else if (index == 2) {
            bukaMenu('Scan');
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const InformasiScreen()),
            );
          }
        },
      ),
    );
  }
}
