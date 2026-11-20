import 'package:material_ui/material_ui.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  static const Color teal = Color(0xFF5B8E8B);
  static const Color background = Color(0xFFEEEEEE);
  static const Color errorRed = Colors.red;

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool isLoading = false;

  // Mengatur tampilan error password tidak cocok.
  bool showMismatchError = false;

  bool get passwordsMismatch {
    return showMismatchError &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        passwordController.text != confirmPasswordController.text;
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              height: 58,
              width: double.infinity,
              color: teal,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Kata Sandi Baru',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // KONTEN
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 22),

                    // KETERANGAN
                    const Text(
                      'Silahkan masukkan kata sandi baru anda',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),

                    const SizedBox(height: 29),

                    // PASSWORD BARU
                    TextField(
                      controller: passwordController,
                      obscureText: obscurePassword,
                      onChanged: (_) {
                        setState(() {});
                      },
                      decoration: passwordDecoration(
                        'Masukkan kata sandi baru',
                        obscurePassword,
                        () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                        hasError: passwordsMismatch,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // KONFIRMASI PASSWORD
                    TextField(
                      controller: confirmPasswordController,
                      obscureText: obscureConfirmPassword,
                      onChanged: (_) {
                        setState(() {});
                      },
                      decoration: passwordDecoration(
                        'Konfirmasi kata sandi',
                        obscureConfirmPassword,
                        () {
                          setState(() {
                            obscureConfirmPassword = !obscureConfirmPassword;
                          });
                        },
                        hasError: passwordsMismatch,
                      ),
                    ),

                    // PESAN ERROR
                    if (passwordsMismatch)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, top: 3),
                          child: const Text(
                            'Password yang dimasukkan tidak sama',
                            style: TextStyle(
                              color: errorRed,
                              fontSize: 9,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),

                    const Spacer(),

                    // TOMBOL KIRIM
                    SizedBox(
                      width: double.infinity,
                      height: 37,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : changePassword,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: teal,
                          foregroundColor: Colors.white,
                          disabledBackgroundColor: teal.withValues(alpha: 0.4),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                'Kirim',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),

                    const SizedBox(height: 14),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // STYLE INPUT PASSWORD
  InputDecoration passwordDecoration(
    String hint,
    bool obscure,
    VoidCallback onToggle, {
    bool hasError = false,
  }) {
    final borderColor = hasError ? errorRed : teal;

    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 11, color: Color(0xFFD0D0D0)),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      suffixIcon: IconButton(
        onPressed: onToggle,
        icon: Icon(
          obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: const Color(0xFFD0D0D0),
          size: 17,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: BorderSide(
          color: hasError ? errorRed : Colors.transparent,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: BorderSide(color: borderColor, width: 1.2),
      ),
    );
  }

  // FUNGSI GANTI PASSWORD
  Future<void> changePassword() async {
    if (passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Semua kolom harus diisi!')));
      return;
    }

    if (passwordController.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password minimal 8 karakter!')),
      );
      return;
    }

    // CEK KECOCOKAN PASSWORD
    if (passwordController.text != confirmPasswordController.text) {
      setState(() {
        showMismatchError = true;
      });
      return;
    }

    setState(() {
      isLoading = true;
      showMismatchError = false;
    });

    // SIMULASI PROSES PERUBAHAN PASSWORD
    // Nantinya hubungkan ke Firebase atau API.
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password berhasil diperbarui!')),
    );

    Navigator.popUntil(context, (route) => route.isFirst);
  }
}
