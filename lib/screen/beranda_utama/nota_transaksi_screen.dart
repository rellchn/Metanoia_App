import 'package:material_ui/material_ui.dart';

import 'riwayat_screen.dart';

class NotaTransaksiScreen extends StatelessWidget {
  final Transaksi transaksi;

  const NotaTransaksiScreen({super.key, required this.transaksi});

  static const Color teal = Color(0xFF5B8E8B);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC6C6C6),
      appBar: AppBar(
        backgroundColor: teal,
        foregroundColor: Colors.white,
        title: const Text(
          'Nota Transaksi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 430),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(color: Colors.black, thickness: 1),

                const SizedBox(height: 4),

                const Text(
                  'BSSE',
                  style: TextStyle(
                    color: teal,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),

                const Text(
                  'Bank Sampah Saung Egang',
                  style: TextStyle(fontSize: 12),
                ),

                const SizedBox(height: 12),

                Container(
                  width: double.infinity,
                  color: teal,
                  padding: const EdgeInsets.all(6),
                  child: const Text(
                    'Jl. Cikondang No. 48 Sadang Serang, Bandung',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 9),
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  transaksi.tanggal,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Divider(color: Colors.black),

                const Row(
                  children: [
                    SizedBox(
                      width: 22,
                      child: Text(
                        'No',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        'Item',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Berat (Kg)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Price (Rp)',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const Divider(color: Colors.black),

                ...transaksi.items.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;

                  return Container(
                    color: index.isEven
                        ? const Color(0xFFE5F2F8)
                        : Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 22,
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(fontSize: 9),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            item['nama'].toString(),
                            style: const TextStyle(fontSize: 9),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            item['berat'].toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 9),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            formatRupiah(item['harga'] as int),
                            textAlign: TextAlign.right,
                            style: const TextStyle(fontSize: 9),
                          ),
                        ),
                      ],
                    ),
                  );
                }),

                const Divider(color: Colors.black, thickness: 1),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'TOTAL',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      formatRupiah(transaksi.total),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                const Text(
                  'Note:',
                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),

                const SizedBox(height: 30),

                const Center(
                  child: Text(
                    'RECEIPT',
                    style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
