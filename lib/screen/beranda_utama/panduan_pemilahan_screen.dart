import 'package:material_ui/material_ui.dart';

class PanduanPemilahanScreen extends StatelessWidget {
  const PanduanPemilahanScreen({super.key});

  static const Color teal = Color(0xFF5B8E8B);
  static const Color background = Color(0xFFEEEEEE);

  Widget bagianJudul(String judul) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        judul,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget paragraf(String isi) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 12),
      child: Text(
        isi,
        textAlign: TextAlign.justify,
        style: const TextStyle(fontSize: 12, height: 1.25, color: Colors.black),
      ),
    );
  }

  Widget daftar(List<String> items, {bool bernomor = false}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(items.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 18,
                  child: Text(
                    bernomor ? '${index + 1}.' : '•',
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                Expanded(
                  child: Text(
                    items[index],
                    style: const TextStyle(fontSize: 12, height: 1.2),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget caraMemilah(String isi) {
    return paragraf('Cara memilah: $isi');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: teal,
        foregroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 78,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Panduan Pemilahan',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bagianJudul('1. Sampah Organik'),
            paragraf(
              'Sampah organik berasal dari bahan alami yang dapat '
              'terurai secara biologis.',
            ),
            paragraf('Contohnya:'),
            daftar([
              'Sisa sayuran dan buah-buahan',
              'Kulit pisang dan kulit jeruk',
              'Daun kering dan sisa tanaman',
              'Sisa makanan',
            ]),
            caraMemilah(
              'Pisahkan sampah organik dari sampah lainnya. '
              'Sisa makanan sebaiknya tidak dicampur dengan sampah '
              'anorganik yang akan disetorkan ke bank sampah. '
              'Sampah organik dapat diolah menjadi kompos sesuai '
              'jenis dan kondisi bahannya.',
            ),

            bagianJudul('2. Sampah Anorganik'),
            paragraf(
              'Sampah anorganik merupakan sampah seperti plastik, '
              'logam, kaca, dan bahan lain yang umumnya lebih sulit '
              'terurai. Sebagian di antaranya dapat didaur ulang.',
            ),
            paragraf('Contohnya:'),
            daftar([
              'Botol dan gelas plastik',
              'Kardus dan kertas',
              'Kaleng minuman',
              'Botol kaca',
              'Kemasan plastik tertentu',
            ]),
            caraMemilah(
              'Pisahkan berdasarkan jenis materialnya. Kosongkan '
              'isinya, bersihkan jika diperlukan, lalu keringkan '
              'sebelum disimpan. Simpan kardus dan kertas dalam '
              'keadaan kering agar kualitasnya tetap terjaga.',
            ),

            bagianJudul('3. Sampah B3 (Bahan Berbahaya dan Beracun)'),
            paragraf(
              'Sampah B3 rumah tangga merupakan sampah yang '
              'mengandung bahan berbahaya sehingga membutuhkan '
              'penanganan khusus.',
            ),
            paragraf('Contohnya:'),
            daftar([
              'Baterai bekas',
              'Lampu tertentu',
              'Kemasan bekas bahan kimia',
              'Obat-obatan kedaluwarsa',
              'Produk elektronik tertentu',
            ]),
            caraMemilah(
              'Pisahkan dari sampah rumah tangga lainnya. Jangan '
              'membakar, membongkar, atau membuangnya sembarangan. '
              'Serahkan melalui fasilitas atau program pengumpulan '
              'yang menerima jenis sampah tersebut.',
            ),

            bagianJudul('4. Sebelum Menyetorkan Sampah'),
            daftar([
              'Pisahkan sampah berdasarkan jenis materialnya.',
              'Pastikan sampah yang dapat didaur ulang sudah kosong, bersih bila diperlukan, dan kering.',
              'Simpan sampah di tempat yang tidak tercampur dengan sampah lain.',
              'Periksa jenis sampah yang diterima oleh bank sampah tujuan sebelum melakukan penyetoran.',
            ], bernomor: true),

            const Padding(
              padding: EdgeInsets.only(left: 12, bottom: 8),
              child: Text(
                'Perlu diingat!',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 8),
              padding: const EdgeInsets.all(8),
              color: const Color(0xFFFFE45C),
              child: const Text(
                'Tidak semua jenis sampah diterima oleh setiap bank '
                'sampah. Jenis material, kondisi sampah, dan nilai '
                'ekonominya dapat berbeda-beda. Pastikan kamu '
                'mengikuti ketentuan bank sampah tempatmu menyetor.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 12,
                  height: 1.2,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
