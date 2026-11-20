import 'package:material_ui/material_ui.dart';

import 'nota_transaksi_screen.dart';
import 'app_bottom_navigation.dart';
import 'informasi_screen.dart';
import 'saya_screen.dart';

class Transaksi {
  final String tanggal;
  final List<Map<String, dynamic>> items;
  final int total;

  const Transaksi({
    required this.tanggal,
    required this.items,
    required this.total,
  });
}

class RiwayatScreen extends StatelessWidget {
  const RiwayatScreen({super.key});

  static const Color teal = Color(0xFF5B8E8B);
  static const Color background = Color(0xFFEEEEEE);

  static const List<Transaksi> daftarTransaksi = [
    Transaksi(
      tanggal: 'Rabu, 7 Okt 2026',
      items: [
        {'nama': 'Botol (P10)', 'berat': '2 Kg', 'harga': 10000},
        {'nama': 'Gelas Sablon (P09)', 'berat': '7 Kg', 'harga': 20000},
      ],
      total: 30000,
    ),
    Transaksi(
      tanggal: 'Minggu, 11 Okt 2026',
      items: [
        {'nama': 'Botol (P10)', 'berat': '2 Kg', 'harga': 10000},
        {'nama': 'Gelas Sablon (P09)', 'berat': '7 Kg', 'harga': 20000},
      ],
      total: 30000,
    ),
  ];

  String formatRupiah(int nominal) {
    final angka = nominal.toString();
    final buffer = StringBuffer();

    for (int i = 0; i < angka.length; i++) {
      buffer.write(angka[i]);
      final sisa = angka.length - i - 1;
      if (sisa > 0 && sisa % 3 == 0) {
        buffer.write('.');
      }
    }

    return 'Rp ${buffer.toString()}';
  }

  void bukaNota(BuildContext context, Transaksi transaksi) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NotaTransaksiScreen(transaksi: transaksi),
      ),
    );
  }

  void showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('$feature akan segera tersedia.')));
  }

  Widget buildBottomNavigation(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _RiwayatNavItem(
            icon: Icons.home_outlined,
            label: 'Beranda',
            selected: false,
            onTap: () => Navigator.pop(context),
          ),

          _RiwayatNavItem(
            icon: Icons.history,
            label: 'Riwayat',
            selected: true,
            onTap: () {},
          ),

          Transform.translate(
            offset: const Offset(0, -12),
            child: GestureDetector(
              onTap: () => showComingSoon(context, 'Scan'),
              child: Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: teal,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.qr_code_scanner, color: Colors.white, size: 27),
                    Text(
                      'SCAN HERE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 6,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          _RiwayatNavItem(
            icon: Icons.info_outline,
            label: 'Informasi',
            selected: false,
            onTap: () => showComingSoon(context, 'Informasi'),
          ),

          _RiwayatNavItem(
            icon: Icons.person_outline,
            label: 'Saya',
            selected: false,
            onTap: () => showComingSoon(context, 'Profil'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      appBar: AppBar(
        backgroundColor: teal,
        foregroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Riwayat Transaksi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(14),
        itemCount: daftarTransaksi.length,
        itemBuilder: (context, index) {
          final transaksi = daftarTransaksi[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFD0D0D0),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaksi.tanggal,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 7),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  color: const Color(0xFFF5F5F5),
                  child: Column(
                    children: transaksi.items.map((item) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                item['nama'].toString(),
                                style: const TextStyle(fontSize: 10),
                              ),
                            ),
                            Text(
                              item['berat'].toString(),
                              style: const TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Total Transaksi : ',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      formatRupiah(transaksi.total),
                      style: const TextStyle(
                        color: teal,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () => bukaNota(context, transaksi),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: teal,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      child: const Text(
                        'Detail',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),

      // NAVBAR BAWAH
      bottomNavigationBar: AppBottomNavigation(
        selectedIndex: 1,
        onTap: (index) {
          switch (index) {
            case 0:
              // Kembali ke Beranda
              Navigator.pop(context);
              break;

            case 1:
              // Tetap di halaman Riwayat
              break;

            case 2:
              // Menu Scan
              showComingSoon(context, 'Scan');
              break;

            case 3:
              // Pindah ke Informasi
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InformasiScreen(),
                ),
              );
              break;

            case 4:
              // Pindah ke Profil Saya
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SayaScreen()),
              );
              break;
          }
        },
      ),
    );
  }
}

class _RiwayatNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _RiwayatNavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? const Color(0xFF5B8E8B) : Colors.grey;

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 58,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 25, color: color),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 8,
                color: color,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
