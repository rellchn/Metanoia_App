import 'package:material_ui/material_ui.dart';

import 'login_screen.dart';
import 'register_screen.dart';

class AppColors {
  static const teal = Color(0xFF5B8E8B);
  static const tealLight = Color(0xFF9DB8B7);
  static const yellow = Color(0xFFF4C430);
  static const yellowBorder = Color(0xFFD9A91E);
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Dekorasi atas (lengkung hijau)
          Positioned.fill(child: CustomPaint(painter: _TopShapePainter())),
          // Dekorasi bawah kanan
          Positioned.fill(child: CustomPaint(painter: _BottomShapePainter())),
          // Konten
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 90),
                    // Logo Metanoia (taruh gambar di assets/images/logo_metanoia.png)
                    Image.asset(
                      'assets/images/metanoia.webp',
                      width: 220,
                      fit: BoxFit.contain,
                      errorBuilder: (_, _, _) => const SizedBox(
                        width: 220,
                        height: 220,
                        child: Center(
                          child: Text(
                            'METANOIA',
                            style: TextStyle(
                              fontSize: 28,
                              letterSpacing: 6,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Selamat datang di metanoia ingin masuk sebagai?',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.black87),
                    ),
                    const SizedBox(height: 12),
                    _AppButton(
                      label: 'Masuk Sebagai Petugas',
                      color: AppColors.yellow,
                      borderColor: AppColors.yellowBorder,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const LoginScreen(role: 'Petugas'),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    _AppButton(
                      label: 'Masuk Sebagai Warga',
                      color: AppColors.teal,
                      borderColor: AppColors.teal,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const LoginScreen(role: 'Warga'),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 48),
                    const Text(
                      'Atau belum memiliki akun?',
                      style: TextStyle(fontSize: 12, color: Colors.black87),
                    ),
                    const SizedBox(height: 12),
                    _AppButton(
                      label: 'Daftar Sebagai Warga',
                      color: AppColors.teal,
                      borderColor: AppColors.teal,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppButton extends StatelessWidget {
  final String label;
  final Color color;
  final Color borderColor;
  final VoidCallback onPressed;

  const _AppButton({
    required this.label,
    required this.color,
    required this.borderColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 46,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 2,
          shadowColor: Colors.black38,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(color: borderColor, width: 2),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class _TopShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Blob hijau muda di belakang (kiri)
    final light = Paint()..color = AppColors.tealLight;
    canvas.drawOval(
      Rect.fromLTWH(-w * 0.45, h * 0.17, w * 0.95, h * 0.14),
      light,
    );

    // Bentuk hijau utama
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(w, 0)
      ..lineTo(w, h * 0.06)
      ..quadraticBezierTo(w * 0.70, h * 0.30, 0, h * 0.25)
      ..close();
    canvas.drawPath(path, Paint()..color = AppColors.teal);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _BottomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    canvas.drawCircle(
      Offset(w * 0.98, h + w * 0.28),
      w * 0.55,
      Paint()..color = AppColors.teal,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
