import 'package:material_ui/material_ui.dart';

import 'app_bottom_navigation.dart';
import 'saya_screen.dart';
import 'panduan_pemilahan_screen.dart';
import 'tentang_bsse_screen.dart';
import 'jenis_sampah_screen.dart';

class InformasiScreen extends StatelessWidget {
  const InformasiScreen({super.key});

  static const Color teal = Color(0xFF5B8E8B);
  static const Color background = Color(0xFFEEEEEE);

  void bukaHalaman(BuildContext context, String judul) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('$judul akan segera tersedia.')));
  }

  @override
  Widget build(BuildContext context) {
    Widget menuInformasi(String judul, VoidCallback onTap) {
      return InkWell(
        onTap: onTap,
        child: Container(
          height: 37,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xFFCCCCCC))),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  judul,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right, size: 20, color: Colors.black),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 63,
              color: teal,
              alignment: Alignment.center,
              child: const Text(
                'Informasi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SizedBox(height: 7),
                    menuInformasi('Jenis Sampah', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const JenisSampahScreen(),
                        ),
                      );
                    }),
                    menuInformasi('Panduan Pemilahan Sampah', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PanduanPemilahanScreen(),
                        ),
                      );
                    }),
                    menuInformasi('Tentang BSSE', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TentangBSSEScreen(),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigation(
        selectedIndex: 3,
        onTap: (index) {
          if (index == 0 || index == 1) {
            Navigator.pop(context);
          } else if (index == 2) {
            bukaHalaman(context, 'Scan');
          } else if (index == 4) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const SayaScreen()),
            );
          }
        },
      ),
    );
  }
}
