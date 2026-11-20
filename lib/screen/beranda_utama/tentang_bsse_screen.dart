import 'package:material_ui/material_ui.dart';

class TentangBSSEScreen extends StatelessWidget {
  const TentangBSSEScreen({super.key});

  static const Color teal = Color(0xFF5B8E8B);
  static const Color background = Color(0xFFEEEEEE);

  Widget paragraf(String isi) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Text(
        isi,
        textAlign: TextAlign.justify,
        style: const TextStyle(fontSize: 11, height: 1.3, color: Colors.black),
      ),
    );
  }

  Widget subJudul(String isi) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        isi,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
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
        elevation: 0,
        toolbarHeight: 78,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Tentang BSSE',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 18, 22, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            paragraf('Profil dan Fungsi Utama'),
            paragraf(
              'Bank Sampah Saung Egang merupakan salah satu unit '
              'pengelolaan dan penukaran sampah anorganik terpilah '
              'yang berada di bawah naungan UPT Pengelolaan Sampah, '
              'Dinas Lingkungan Hidup (DLH) Kota Bandung.',
            ),
            paragraf(
              'Warga dapat menyetorkan sampah anorganik, seperti '
              'plastik, kertas, kardus, dan minyak jelantah, untuk '
              'ditimbang dan dicatat sebagai saldo tabungan sesuai '
              'dengan ketentuan yang berlaku.',
            ),

            subJudul('Fungsi Utama :'),

            subJudul('1. Penimbangan Sampah'),
            paragraf(
              'Sampah yang disetorkan ditimbang sesuai dengan jenisnya.',
            ),

            subJudul('2. Pencatatan Saldo'),
            paragraf(
              'Hasil penimbangan dicatat sebagai saldo tabungan '
              'sesuai ketentuan bank sampah.',
            ),

            subJudul('3. Pengelolaan Sampah Terpilah'),
            paragraf(
              'Mendorong pemilahan sampah agar material yang masih '
              'dapat dimanfaatkan tidak langsung dibuang.',
            ),

            paragraf(
              'Alamat Lokasi: Saung Egang, RW 20, Kelurahan Sadang '
              'Serang, Kecamatan Coblong, Kota Bandung, Jawa Barat.',
            ),

            paragraf('Jadwal penyetoran : Rabu - Minggu'),

            paragraf('Kontak pengelola : 0812 2280 1515 (Pak ajat)'),
          ],
        ),
      ),
    );
  }
}
