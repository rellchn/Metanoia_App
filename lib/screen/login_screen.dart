import 'package:material_ui/material_ui.dart';

import 'register_screen.dart';
import 'forgot_password_screen.dart';
import 'beranda_utama/home_screen.dart';

class LoginScreen extends StatefulWidget {
  final String role;

  const LoginScreen({super.key, this.role = 'Warga'});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;

  static const Color teal = Color(0xFF5B8E8B);
  static const Color purple = Color(0xFF9747FF);

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
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

                    // LOGO METANOIA (FOTO)
                    Positioned(
                      top: 75,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Image.asset(
                          'assets/images/Mlogo.png',
                          width: 220,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    // CARD LOGIN
                    Positioned(
                      top: 180,
                      left: 14,
                      right: 14,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(30, 36, 30, 65),
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
                              'Silahkan masuk ke akun anda!',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),

                            const SizedBox(height: 17),

                            // LABEL LOGIN
                            const Text('Login', style: TextStyle(fontSize: 10)),

                            const SizedBox(height: 6),

                            // INPUT NOMOR TELEPON
                            TextField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: inputDecoration(
                                'Masukkan no Telephone',
                              ),
                            ),

                            const SizedBox(height: 11),

                            // LABEL PASSWORD
                            const Text(
                              'Password',
                              style: TextStyle(fontSize: 10),
                            ),

                            const SizedBox(height: 5),

                            // INPUT PASSWORD
                            TextField(
                              controller: passwordController,
                              obscureText: obscurePassword,
                              decoration:
                                  inputDecoration(
                                    'Masukkan Password',
                                    borderColor: purple,
                                  ).copyWith(
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          obscurePassword = !obscurePassword;
                                        });
                                      },
                                      icon: Icon(
                                        obscurePassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        size: 17,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                            ),

                            // LUPA PASSWORD
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgotPasswordScreen(),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: const Text(
                                  'Lupa password?',
                                  style: TextStyle(fontSize: 10, color: teal),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            // TOMBOL MASUK
                            SizedBox(
                              width: double.infinity,
                              height: 29,
                              child: ElevatedButton(
                                onPressed: login,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: teal,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: const Text(
                                  'Masuk',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 8),

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Belum Punya Akun?'
                                'Daftar',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: teal,
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

  // STYLE INPUT TEXTFIELD
  InputDecoration inputDecoration(
    String hint, {
    Color borderColor = const Color(0xFFDDDDDD),
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 12, color: Color(0xFFD0D0D0)),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: borderColor, width: 2),
      ),
    );
  }

  // FUNGSI LOGIN - PENGUJIAN FRONT END
  void login() {
    if (phoneController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Silahkan isi nomor telepon dan password!'),
        ),
      );
      return;
    }

    // PENGUJIAN NAVIGASI SAJA
    // Belum melakukan autentikasi akun.
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (route) => false,
    );
    // TODO: Hubungkan dengan API / Firebase
  }
}
