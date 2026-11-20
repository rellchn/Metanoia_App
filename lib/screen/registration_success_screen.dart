import 'package:material_ui/material_ui.dart';

import 'complete_profile_screen.dart';

class RegistrationSuccessScreen extends StatelessWidget {
  const RegistrationSuccessScreen({super.key});

  static const Color teal = Color(0xFF5B8E8B);
  static const Color background = Color(0xFFEEEEEE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                // DEKORASI TEAL BAGIAN ATAS
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 270,
                  child: ClipPath(
                    clipper: _HeaderClipper(),
                    child: Container(color: teal),
                  ),
                ),

                // DEKORASI BAGIAN BAWAH
                Positioned(
                  bottom: -75,
                  right: -65,
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      color: teal.withValues(alpha: 0.55),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

                // KONTEN
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        const SizedBox(height: 22),

                        // GAMBAR PENDAFTARAN BERHASIL
                        Center(
                          child: Image.asset(
                            'assets/images/LogPhone.png',
                            width: 180,
                            height: 150,
                            fit: BoxFit.contain,
                          ),
                        ),

                        const SizedBox(height: 7),

                        // JUDUL
                        const Text(
                          'Pendaftaran Berhasil!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 3),

                        const Text(
                          'Selanjutnya, lengkapi data diri untuk menjadi nasabah\n'
                          'Bank Sampah Saung Egang.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 8, color: Colors.black87),
                        ),

                        const SizedBox(height: 24),

                        // KARTU INFORMASI
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 13,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE1E4E3),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: const Column(
                            children: [
                              _InfoRow(
                                icon: Icons.person_add_alt_1,
                                title: 'Lengkapi data pribadi',
                                subtitle: 'Masukkan nama lengkap dan NIK',
                              ),
                              SizedBox(height: 12),
                              _InfoRow(
                                icon: Icons.verified_user,
                                title: 'Pastikan data benar',
                                subtitle: 'Sesuaikan dengan identitasmu',
                              ),
                              SizedBox(height: 12),
                              _InfoRow(
                                icon: Icons.phone_android,
                                title: 'Mulai gunakan aplikasi',
                                subtitle:
                                    'Akses fitur Bank Sampah Saung Gegang',
                              ),
                            ],
                          ),
                        ),

                        const Spacer(),

                        // TOMBOL LENGKAPI DATA
                        SizedBox(
                          width: double.infinity,
                          height: 37,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CompleteProfileScreen(),
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
                              'Lengkapi Data Diri',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// KARTU INFORMASI
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _InfoRow({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: RegistrationSuccessScreen.teal, size: 25),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: RegistrationSuccessScreen.teal,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.grey, fontSize: 8),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// LENGKUNGAN HEADER
class _HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height - 38)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height + 45,
        size.width,
        size.height - 38,
      )
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
