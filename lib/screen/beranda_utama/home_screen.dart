import 'package:material_ui/material_ui.dart';

import 'pesan_masuk_screen.dart';
import 'riwayat_screen.dart';
import 'informasi_screen.dart';
import 'saya_screen.dart';
import 'pengajuan_penarikan_store.dart';
import 'kategori_sampah/kategori_plastik_screen.dart';
import 'kategori_sampah/kategori_sampah_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const Color teal = Color(0xFF5B8E8B);
  static const Color background = Color(0xFFEEEEEE);
  static const int saldoSaatIni = 540000;

  int selectedIndex = 0;
  int _currentAnnouncementIndex = 0;

  String? _notificationMessage;

  final PageController announcementController = PageController();

  final List<String> announcementImages = [
    'assets/images/Pengumuman_1.png',
    'assets/images/Pengumuman_2.png',
    'assets/images/Pengumuman_3.png',
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

  void showComingSoon(String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature akan segera tersedia.'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _showWithdrawalDialog() async {
    final berhasil = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return _WithdrawalDialog(
          saldoSaatIni: saldoSaatIni,
          formatRupiah: formatRupiah,
        );
      },
    );

    if (!mounted) return;

    if (berhasil == true) {
      setState(() {
        _notificationMessage = 'Pengajuan penarikan saldo berhasil dikirim.';
      });
    }
  }

  @override
  void dispose() {
    announcementController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            if (_notificationMessage != null) _buildSuccessNotification(),

            _buildHeader(),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(23, 42, 23, 20),
                children: [
                  const Text(
                    'Jadwal Buka',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 7),

                  _buildOpeningSchedule(),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Pengumuman',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => showComingSoon('Semua pengumuman'),
                        child: const Text(
                          'Lihat semua',
                          style: TextStyle(color: teal, fontSize: 10),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 7),

                  _buildAnnouncementCarousel(),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Kategori',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => showComingSoon('Semua kategori'),
                        child: const Text(
                          'Selengkapnya',
                          style: TextStyle(fontSize: 9, color: teal),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1.65,
                    children: [
                      _CategoryCard(
                        title: 'Plastik',
                        imagePath: 'assets/images/Plastik.png',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const KategoriPlastikScreen(),
                            ),
                          );
                        },
                      ),
                      _CategoryCard(
                        title: 'Kertas',
                        imagePath: 'assets/images/Kertas.png',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const KategoriSampahScreen(
                                namaKategori: 'Kertas',
                                daftarKode: [
                                  'K01',
                                  'K02',
                                  'K03',
                                  'K04',
                                  'KOS',
                                  'K06',
                                  'K07',
                                  'K09',
                                  'K10',
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      _CategoryCard(
                        title: 'Logam',
                        imagePath: 'assets/images/Logam.png',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const KategoriSampahScreen(
                                namaKategori: 'Logam',
                                daftarKode: [
                                  'A3',
                                  'L01',
                                  '501',
                                  '502',
                                  '503',
                                  'T01',
                                  'T02',
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      _CategoryCard(
                        title: 'Kaca',
                        imagePath: 'assets/images/Kaca.png',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const KategoriSampahScreen(
                                namaKategori: 'Kaca',
                                daftarKode: ['808', '809', '810', '811'],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildSuccessNotification() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(12, 8, 12, 5),
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 17,
            backgroundColor: teal,
            child: Icon(Icons.notifications, color: Colors.white, size: 19),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pengajuan Penarikan',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
                Text(
                  _notificationMessage!,
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _notificationMessage = null;
              });
            },
            icon: const Icon(Icons.close, size: 17),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      height: 194,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: 194,
            decoration: const BoxDecoration(
              color: teal,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
          ),

          Positioned(
            right: -55,
            top: -105,
            child: Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.13),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            right: 18,
            top: 14,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PesanMasukScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.mail_outline, color: Colors.white),
            ),
          ),

          Positioned(
            left: 23,
            top: 65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selamat Datang',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(height: 3),
                const Text(
                  'Hafidh Tedi Setiawan',
                  style: TextStyle(
                    color: Color(0xFFFFD34F),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 34),
                const Text(
                  'Buat lingkunganmu menjadi lebih baik!',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ],
            ),
          ),

          Positioned(
            left: 23,
            right: 23,
            bottom: -29,
            child: _buildBalanceCard(),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      height: 59,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.account_balance_wallet, color: teal, size: 28),
          const SizedBox(width: 10),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Saldo saat ini',
                  style: TextStyle(fontSize: 10, color: Colors.black54),
                ),
                Text(
                  formatRupiah(saldoSaatIni),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 30,
            child: ElevatedButton(
              onPressed: _showWithdrawalDialog,
              style: ElevatedButton.styleFrom(
                backgroundColor: teal,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'Ajukan Penarikan',
                style: TextStyle(fontSize: 9),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOpeningSchedule() {
    return Container(
      height: 57,
      padding: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
        color: teal,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFFFD34F),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Icon(Icons.calendar_month, color: teal, size: 34),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Buka setiap hari Rabu & Minggu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Pukul 10:00 s/d 17:00 WIB',
                  style: TextStyle(color: Colors.white70, fontSize: 9),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncementCarousel() {
    return Column(
      children: [
        SizedBox(
          height: 160,
          child: PageView.builder(
            controller: announcementController,
            itemCount: announcementImages.length,
            onPageChanged: (index) {
              setState(() {
                _currentAnnouncementIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  image: DecorationImage(
                    image: AssetImage(announcementImages[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            announcementImages.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: _currentAnnouncementIndex == index ? 18 : 7,
              height: 7,
              decoration: BoxDecoration(
                color: _currentAnnouncementIndex == index
                    ? teal
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      height: 69,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            blurRadius: 6,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: Icons.home_outlined,
            label: 'Beranda',
            selected: selectedIndex == 0,
            onTap: () => setState(() => selectedIndex = 0),
          ),
          _NavItem(
            icon: Icons.history,
            label: 'Riwayat',
            selected: selectedIndex == 1,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RiwayatScreen()),
              );
            },
          ),

          Transform.translate(
            offset: const Offset(0, -12),
            child: GestureDetector(
              onTap: () => showComingSoon('Setor sampah'),
              child: Container(
                width: 67,
                height: 67,
                decoration: BoxDecoration(
                  color: teal,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.qr_code_scanner, color: Colors.white, size: 29),
                    Text(
                      'SCAN',
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

          _NavItem(
            icon: Icons.info_outline,
            label: 'Informasi',
            selected: selectedIndex == 3,
            onTap: () {
              setState(() => selectedIndex = 3);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InformasiScreen(),
                ),
              );
            },
          ),
          _NavItem(
            icon: Icons.person_outline,
            label: 'Saya',
            selected: selectedIndex == 4,
            onTap: () {
              setState(() => selectedIndex = 4);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SayaScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF5D77C),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.image_not_supported,
                      size: 40,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WithdrawalDialog extends StatefulWidget {
  final int saldoSaatIni;
  final String Function(int) formatRupiah;

  const _WithdrawalDialog({
    required this.saldoSaatIni,
    required this.formatRupiah,
  });

  @override
  State<_WithdrawalDialog> createState() => _WithdrawalDialogState();
}

class _WithdrawalDialogState extends State<_WithdrawalDialog> {
  final TextEditingController nominalController = TextEditingController();

  final TextEditingController catatanController = TextEditingController();

  String? errorNominal;

  @override
  void dispose() {
    nominalController.dispose();
    catatanController.dispose();
    super.dispose();
  }

  void _kirimPengajuan() {
    final nominal =
        int.tryParse(
          nominalController.text.replaceAll(RegExp(r'[^0-9]'), ''),
        ) ??
        0;

    setState(() {
      if (nominal <= 0) {
        errorNominal = 'Nominal wajib diisi.';
      } else if (nominal > widget.saldoSaatIni) {
        errorNominal = 'Saldo tidak mencukupi!';
      } else {
        errorNominal = null;
      }
    });

    if (errorNominal != null) return;

    PengajuanPenarikanStore.tambah(
      nominal: nominal,
      catatan: catatanController.text.trim(),
    );

    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: const Text(
        'Ajukan Penarikan Saldo',
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        width: 340,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Saldo Tersedia', style: TextStyle(fontSize: 12)),
              const SizedBox(height: 5),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAEAEA),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  widget.formatRupiah(widget.saldoSaatIni),
                  style: const TextStyle(
                    color: Color(0xFF5B8E8B),
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              const Text('Nominal Penarikan', style: TextStyle(fontSize: 12)),
              const SizedBox(height: 6),

              TextField(
                controller: nominalController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixText: 'Rp ',
                  hintText: 'Masukkan nominal',
                  errorText: errorNominal,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(color: Color(0xFF5B8E8B)),
                  ),
                  contentPadding: const EdgeInsets.all(12),
                ),
                onChanged: (value) {
                  final nominal =
                      int.tryParse(value.replaceAll(RegExp(r'[^0-9]'), '')) ??
                      0;

                  setState(() {
                    if (value.isEmpty) {
                      errorNominal = null;
                    } else if (nominal <= 0) {
                      errorNominal = 'Masukkan nominal yang valid.';
                    } else if (nominal > widget.saldoSaatIni) {
                      errorNominal = 'Saldo tidak mencukupi!';
                    } else {
                      errorNominal = null;
                    }
                  });
                },
              ),

              const SizedBox(height: 14),

              const Text('Catatan (Opsional)', style: TextStyle(fontSize: 12)),
              const SizedBox(height: 6),

              TextField(
                controller: catatanController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Tambahkan catatan...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  contentPadding: const EdgeInsets.all(12),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _kirimPengajuan,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5B8E8B),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 13),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            child: const Text('Kirim Pengajuan'),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Batal', style: TextStyle(color: Colors.black54)),
          ),
        ),
      ],
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color itemColor = selected ? const Color(0xFF5B8E8B) : Colors.grey;

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 58,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 25, color: itemColor),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 8,
                color: itemColor,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
