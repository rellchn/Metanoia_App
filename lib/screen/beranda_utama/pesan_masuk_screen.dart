import 'package:material_ui/material_ui.dart';

import 'pengajuan_penarikan_detail_screen.dart';
import 'pengajuan_penarikan_store.dart';

class PesanMasukScreen extends StatelessWidget {
  const PesanMasukScreen({super.key});

  static const Color teal = Color(0xFF5B8E8B);
  static const Color background = Color(0xFFEEEEEE);

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

    return 'Rp $buffer';
  }

  void _openDetail(BuildContext context, PengajuanPenarikan pengajuan) {
    PengajuanPenarikanStore.tandaiDibaca(pengajuan);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PengajuanPenarikanDetailScreen(),
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
        title: const Text(
          'Pesan Masuk',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ValueListenableBuilder<List<PengajuanPenarikan>>(
        valueListenable: PengajuanPenarikanStore.daftar,
        builder: (context, notifications, child) {
          if (notifications.isEmpty) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.mark_email_read_outlined,
                    size: 55,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Belum ada pesan masuk',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(14),
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];

              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(9),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.12),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () => _openDetail(context, notification),
                  borderRadius: BorderRadius.circular(9),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          decoration: const BoxDecoration(
                            color: teal,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.notifications_none,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 9),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Expanded(
                                    child: Text(
                                      'Pengajuan Penarikan',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    notification.waktu,
                                    style: const TextStyle(
                                      fontSize: 9,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'Pengajuan penarikan '
                                '${formatRupiah(notification.nominal)} '
                                'berhasil dikirim.',
                                style: const TextStyle(
                                  fontSize: 9,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                notification.tanggal,
                                style: const TextStyle(
                                  fontSize: 8,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                        if (!notification.sudahDibaca)
                          const Icon(
                            Icons.circle,
                            color: Colors.redAccent,
                            size: 9,
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
