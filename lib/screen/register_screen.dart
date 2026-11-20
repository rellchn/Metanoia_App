import 'package:material_ui/material_ui.dart';

import 'registration_success_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  static const Color teal = Color(0xFF5B8E8B);

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final height = constraints.maxHeight;

            return SingleChildScrollView(
              child: SizedBox(
                height: height < 720 ? 720 : height,
                child: Stack(
                  children: [
                    // HEADER TEAL
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: 280,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: teal,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                      ),
                    ),

                    // TOMBOL KEMBALI
                    Positioned(
                      top: 22,
                      left: 12,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),

                    // LOGO METANOIA
                    Positioned(
                      top: 75,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Image.asset(
                          'assets/images/MLogo.png',
                          width: 220,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    // CARD REGISTER
                    Positioned(
                      top: 180,
                      left: 14,
                      right: 14,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(30, 36, 30, 53),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0EEEE),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.18),
                              blurRadius: 3,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // JUDUL
                            const Text(
                              'Selamat Datang',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: teal,
                              ),
                            ),

                            const Text(
                              'Silahkan buat akun anda!',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),

                            const SizedBox(height: 17),

                            // NOMOR TELEPON
                            const Text(
                              'No. telp',
                              style: TextStyle(fontSize: 10),
                            ),

                            const SizedBox(height: 6),

                            TextField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: inputDecoration(
                                'Masukkan no Telephone',
                              ),
                            ),

                            const SizedBox(height: 11),

                            // PASSWORD
                            const Text(
                              'Password',
                              style: TextStyle(fontSize: 10),
                            ),

                            const SizedBox(height: 5),

                            TextField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: inputDecoration('Masukkan password'),
                            ),

                            const SizedBox(height: 11),

                            // KONFIRMASI PASSWORD
                            const Text(
                              'Konfirmasi Password',
                              style: TextStyle(fontSize: 10),
                            ),

                            const SizedBox(height: 5),

                            TextField(
                              controller: confirmPasswordController,
                              obscureText: true,
                              decoration: inputDecoration(
                                'Masukkan ulang password',
                              ),
                            ),

                            const SizedBox(height: 13),

                            // TOMBOL DAFTAR
                            SizedBox(
                              width: double.infinity,
                              height: 29,
                              child: ElevatedButton(
                                onPressed: register,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: teal,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: const Text(
                                  'Daftar',
                                  style: TextStyle(
                                    fontSize: 12,
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
          },
        ),
      ),
    );
  }

  // STYLE TEXTFIELD
  InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 12, color: Color(0xFFD0D0D0)),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Color(0xFFDDDDDD)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Color(0xFFDDDDDD)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: teal, width: 1.5),
      ),
    );
  }

  void register() {
    if (phoneController.text.trim().isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Semua kolom harus diisi!')));
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Konfirmasi password tidak cocok!')),
      );
      return;
    }

    // SIMULASI: validasi Front-End berhasil.
    // Belum melakukan pendaftaran ke server.

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RegistrationSuccessScreen(),
      ),
    );
  }
}
