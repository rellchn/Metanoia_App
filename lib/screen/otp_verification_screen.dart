import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';

import 'new_password_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  const OtpVerificationScreen({super.key, required this.phoneNumber});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  static const Color teal = Color(0xFF5B8E8B);
  static const Color background = Color(0xFFEEEEEE);
  static const Color errorRed = Colors.red;

  // KODE OTP SIMULASI
  // Untuk pengujian front end saja.
  // Nantinya diganti dengan kode dari backend.
  static const String demoOtp = '123456';

  late List<TextEditingController> otpControllers;
  late List<FocusNode> focusNodes;

  bool isLoading = false;
  bool showOtpError = false;

  @override
  void initState() {
    super.initState();

    otpControllers = List.generate(6, (index) => TextEditingController());

    focusNodes = List.generate(6, (index) => FocusNode());
  }

  @override
  void dispose() {
    for (final controller in otpControllers) {
      controller.dispose();
    }

    for (final node in focusNodes) {
      node.dispose();
    }

    super.dispose();
  }

  String get otpCode {
    return otpControllers.map((e) => e.text).join();
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
                    'Kode Verifikasi',
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

                    // INFORMASI OTP
                    Text(
                      'Masukkan kode verifikasi yang telah dikirim ke\n'
                      'nomor ${widget.phoneNumber}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        height: 1.4,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // INPUT OTP 6 DIGIT
                    Row(
                      children: List.generate(6, (index) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: SizedBox(
                              height: 43,
                              child: TextField(
                                controller: otpControllers[index],
                                focusNode: focusNodes[index],
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                textAlign: TextAlign.center,
                                maxLength: 1,
                                style: const TextStyle(
                                  fontSize: 23,
                                  color: Colors.black87,
                                ),
                                decoration: InputDecoration(
                                  counterText: '',
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.zero,

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                      color: showOtpError
                                          ? errorRed
                                          : const Color(0xFFDDDDDD),
                                    ),
                                  ),

                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                      color: showOtpError
                                          ? errorRed
                                          : const Color(0xFFDDDDDD),
                                    ),
                                  ),

                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                      color: showOtpError ? errorRed : teal,
                                      width: 1.5,
                                    ),
                                  ),
                                ),

                                onChanged: (value) {
                                  setState(() {
                                    showOtpError = false;
                                  });

                                  if (value.isNotEmpty) {
                                    if (index < 5) {
                                      focusNodes[index + 1].requestFocus();
                                    } else {
                                      focusNodes[index].unfocus();
                                    }
                                  } else if (index > 0) {
                                    focusNodes[index - 1].requestFocus();
                                  }
                                },
                              ),
                            ),
                          ),
                        );
                      }),
                    ),

                    // PESAN ERROR OTP
                    if (showOtpError)
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          'Kode yang anda masukkan tidak sesuai',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: errorRed,
                            fontSize: 9,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),

                    const Spacer(),

                    // TOMBOL KIRIM
                    SizedBox(
                      width: double.infinity,
                      height: 37,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : verifyOtp,
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

  // VERIFIKASI OTP
  Future<void> verifyOtp() async {
    FocusScope.of(context).unfocus();

    if (otpCode.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Masukkan kode OTP 6 digit!')),
      );
      return;
    }

    setState(() {
      isLoading = true;
      showOtpError = false;
    });

    // SIMULASI VERIFIKASI OTP
    // Nantinya diganti dengan verifikasi dari backend.

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });

    // JIKA OTP SALAH
    if (otpCode != demoOtp) {
      setState(() {
        showOtpError = true;
      });
      return;
    }

    // JIKA OTP BENAR
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NewPasswordScreen()),
    );
  }
}
