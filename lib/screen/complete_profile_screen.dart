import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  static const Color teal = Color(0xFF5B8E8B);

  final nameController = TextEditingController();
  final nikController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    nikController.dispose();
    addressController.dispose();
    super.dispose();
  }

  InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 11, color: Color(0xFFD0D0D0)),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Color(0xFFDDDDDD)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Color(0xFFDDDDDD)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: teal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              height: 80,
              width: double.infinity,
              color: teal,
              alignment: Alignment.center,
              child: const Text(
                'Lengkapi Data Diri',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Data ini digunakan untuk membuat akun\n'
                        'nasabah Bank Saung Gegang',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 9, color: Colors.grey),
                      ),
                    ),

                    const SizedBox(height: 30),

                    const Text('Nama Lengkap', style: TextStyle(fontSize: 10)),
                    const SizedBox(height: 6),
                    TextField(
                      controller: nameController,
                      decoration: inputDecoration('Masukkan nama lengkap'),
                    ),

                    const SizedBox(height: 12),

                    const Text('NIK', style: TextStyle(fontSize: 10)),
                    const SizedBox(height: 6),
                    TextField(
                      controller: nikController,
                      keyboardType: TextInputType.number,
                      maxLength: 16,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: inputDecoration('Masukkan 16 digit NIK')
                          .copyWith(counterText: ''),
                    ),

                    const SizedBox(height: 12),

                    const Text('Alamat', style: TextStyle(fontSize: 10)),
                    const SizedBox(height: 6),
                    TextField(
                      controller: addressController,
                      maxLines: 4,
                      decoration: inputDecoration('Masukkan alamat'),
                    ),

                    const Spacer(),

                    SizedBox(
                      width: double.infinity,
                      height: 37,
                      child: ElevatedButton(
                        onPressed: () {
                          if (nameController.text.trim().isEmpty ||
                              nikController.text.length != 16 ||
                              addressController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Lengkapi semua data dengan benar!',
                                ),
                              ),
                            );
                            return;
                          }

                          // TODO: Kirim data profil ke API backend.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Validasi data berhasil. '
                                'Penyimpanan server belum tersedia.',
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: teal,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text(
                          'Simpan & Lanjutkan',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
