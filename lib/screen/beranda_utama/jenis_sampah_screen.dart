import 'package:material_ui/material_ui.dart';

class SampahItem {
  final String kode;
  final String nama;
  final String deskripsi;
  final String harga;
  final String gambar;

  const SampahItem({
    required this.kode,
    required this.nama,
    required this.deskripsi,
    required this.harga,
    required this.gambar,
  });
}

class SampahKategori {
  final String nama;
  final List<SampahItem> items;

  const SampahKategori({required this.nama, required this.items});
}

class JenisSampahScreen extends StatefulWidget {
  const JenisSampahScreen({super.key});

  @override
  State<JenisSampahScreen> createState() => _JenisSampahScreenState();
}

class _JenisSampahScreenState extends State<JenisSampahScreen> {
  static const Color teal = Color(0xFF5B8E8B);
  static const Color background = Color(0xFFEEEEEE);
  static const Color yellow = Color(0xFFFFE45C);

  // ==================================================
  // DATA JENIS SAMPAH
  // Nama foto otomatis mengikuti kode sampah.
  // Contoh: POS.png, P06.png, K01.png, A3.png.
  // ==================================================

  static const List<SampahKategori> daftarKategori = [
    SampahKategori(
      nama: 'Plastik',
      items: [
        SampahItem(
          kode: 'POS',
          nama: 'Gelas / Cup Bening Bersih',
          deskripsi: 'Gelas plastik bening tanpa warna',
          harga: 'Rp 3.000',
          gambar: 'assets/images/jenis_sampah/POS.png',
        ),
        SampahItem(
          kode: 'P06',
          nama: 'Botol Putih',
          deskripsi: 'Botol plastik putih yang bersih',
          harga: 'Rp 800',
          gambar: 'assets/images/jenis_sampah/P06.png',
        ),
        SampahItem(
          kode: 'P07',
          nama: 'Ember Warna Campur',
          deskripsi: 'Wadah plastik berbagai warna',
          harga: 'Rp 2.500',
          gambar: 'assets/images/jenis_sampah/P07.png',
        ),
        SampahItem(
          kode: 'P08',
          nama: 'Ember Hitam',
          deskripsi: 'Jenis ember berbahan plastik',
          harga: 'Rp 500',
          gambar: 'assets/images/jenis_sampah/P08.png',
        ),
        SampahItem(
          kode: 'P09',
          nama: 'Gelas Sablon / Ale-ale',
          deskripsi: 'Gelas bekas kemasan minuman',
          harga: 'Rp 1.000',
          gambar: 'assets/images/jenis_sampah/P09.png',
        ),
        SampahItem(
          kode: 'P10',
          nama: 'Gelas / Cup Bening Bersih',
          deskripsi: 'Gelas plastik bening yang bersih',
          harga: 'Rp 5.900',
          gambar: 'assets/images/jenis_sampah/P10.png',
        ),
        SampahItem(
          kode: 'P11',
          nama: 'PET Bening Bersih',
          deskripsi: 'Botol plastik PET bening',
          harga: 'Rp 6.100',
          gambar: 'assets/images/jenis_sampah/P11.png',
        ),
        SampahItem(
          kode: 'P12',
          nama: 'Gelas Sablon / Ale-ale',
          deskripsi: 'Gelas plastik sablon bekas minuman',
          harga: 'Rp 5.500',
          gambar: 'assets/images/jenis_sampah/P12.png',
        ),
        SampahItem(
          kode: 'P14',
          nama: 'PET Berwarna',
          deskripsi: 'Botol plastik berwarna',
          harga: 'Rp 1.500',
          gambar: 'assets/images/jenis_sampah/P14.png',
        ),
        SampahItem(
          kode: 'P17',
          nama: 'Plastik Kresek',
          deskripsi: 'Plastik HDPE dan LDPE',
          harga: 'Rp 300',
          gambar: 'assets/images/jenis_sampah/P17.png',
        ),
        SampahItem(
          kode: 'P20',
          nama: 'KIRASAN, IMPILK, PS WARNA, AKRILIK',
          deskripsi: 'Plastik aneka warna dan jenis',
          harga: 'Rp 800',
          gambar: 'assets/images/jenis_sampah/P20.png',
        ),
        SampahItem(
          kode: 'P21',
          nama: 'PS KRISTAL BENING',
          deskripsi: 'Plastik bening berbahan PS',
          harga: 'Rp 3.500',
          gambar: 'assets/images/jenis_sampah/P21.png',
        ),
        SampahItem(
          kode: 'P22',
          nama: 'TUTUP BOTOL AIR MINERAL',
          deskripsi: 'Tutup botol plastik aneka warna',
          harga: 'Rp -',
          gambar: 'assets/images/jenis_sampah/P22.png',
        ),
        SampahItem(
          kode: 'P23',
          nama: 'PVC',
          deskripsi: 'Pipa paralon dan material PVC',
          harga: 'Rp -',
          gambar: 'assets/images/jenis_sampah/P23.png',
        ),
        SampahItem(
          kode: 'P25',
          nama: 'TUTUP GALON',
          deskripsi: 'Tutup galon air minum',
          harga: 'Rp -',
          gambar: 'assets/images/jenis_sampah/P25.png',
        ),
        SampahItem(
          kode: 'P26',
          nama: 'GALON UTUH/BIJI',
          deskripsi: 'Galon plastik utuh atau pecahan',
          harga: 'Rp -',
          gambar: 'assets/images/jenis_sampah/P26.png',
        ),
        SampahItem(
          kode: 'P29',
          nama: 'KASET CD',
          deskripsi: 'CD, DVD, dan kaset bekas',
          harga: 'Rp -',
          gambar: 'assets/images/jenis_sampah/P29.png',
        ),
        SampahItem(
          kode: 'P31',
          nama: 'KARUNG PLASTIK',
          deskripsi: 'Karung plastik bekas',
          harga: 'Rp -',
          gambar: 'assets/images/jenis_sampah/P31.png',
        ),
        SampahItem(
          kode: 'P35',
          nama: 'PLASTIK CAMPUR BOTOL',
          deskripsi: 'Plastik campuran dan botol plastik',
          harga: 'Rp -',
          gambar: 'assets/images/jenis_sampah/P35.png',
        ),
        SampahItem(
          kode: 'P37',
          nama: 'BUBBLE WRAP BENING',
          deskripsi: 'Bubble wrap bening bekas',
          harga: 'Rp -',
          gambar: 'assets/images/jenis_sampah/P37.png',
        ),
        SampahItem(
          kode: 'P38',
          nama: 'BUBBLE WRAP HITAM/WARNA',
          deskripsi: 'Bubble wrap hitam atau berwarna',
          harga: 'Rp -',
          gambar: 'assets/images/jenis_sampah/P38.png',
        ),
      ],
    ),

    SampahKategori(
      nama: 'Kertas',
      items: [
        SampahItem(
          kode: 'K01',
          nama: 'Kertas Putih Arsip',
          deskripsi: 'Kertas putih yang sudah tidak terpakai',
          harga: 'Rp 1.600',
          gambar: 'assets/images/jenis_sampah/K01.png',
        ),
        SampahItem(
          kode: 'K02',
          nama: 'TETRAPACK BERSIH',
          deskripsi: 'Kemasan susu dan minuman',
          harga: 'Rp 300',
          gambar: 'assets/images/jenis_sampah/K02.png',
        ),
        SampahItem(
          kode: 'K03',
          nama: 'KERTAS BURAM/CD',
          deskripsi: 'Koran bekas dan kertas buram',
          harga: 'Rp 700',
          gambar: 'assets/images/jenis_sampah/K03.png',
        ),
        SampahItem(
          kode: 'K04',
          nama: 'Koran Bagus',
          deskripsi: 'Koran yang masih dalam kondisi baik',
          harga: 'Rp 3.200',
          gambar: 'assets/images/jenis_sampah/K04.png',
        ),
        SampahItem(
          kode: 'KOS',
          nama: 'Majalah/Duplek/Karton/Selongsong',
          deskripsi: 'Kertas majalah dan berbagai karton',
          harga: 'Rp 700',
          gambar: 'assets/images/jenis_sampah/KOS.png',
        ),
        SampahItem(
          kode: 'K06',
          nama: 'DUS/KARDUS',
          deskripsi: 'Kardus bekas',
          harga: 'Rp 1.800',
          gambar: 'assets/images/jenis_sampah/K06.png',
        ),
        SampahItem(
          kode: 'K07',
          nama: 'Kertas Campur',
          deskripsi: 'Kertas campuran dan arsip',
          harga: 'Rp 400',
          gambar: 'assets/images/jenis_sampah/K07.png',
        ),
        SampahItem(
          kode: 'K09',
          nama: 'DUPLEK TELOR',
          deskripsi: 'Tempat telur dari bahan duplek',
          harga: 'Rp 600',
          gambar: 'assets/images/jenis_sampah/K09.png',
        ),
        SampahItem(
          kode: 'K10',
          nama: 'TABLOID',
          deskripsi: 'Kertas tabloid dan majalah',
          harga: 'Rp 700',
          gambar: 'assets/images/jenis_sampah/K10.png',
        ),
      ],
    ),

    SampahKategori(
      nama: 'Logam',
      items: [
        SampahItem(
          kode: 'A3',
          nama: 'ALUMINIUM',
          deskripsi: 'Kaleng, aluminium, dan material aluminium',
          harga: 'Rp 10.000',
          gambar: 'assets/images/jenis_sampah/A3.png',
        ),
        SampahItem(
          kode: 'L01',
          nama: 'BESI',
          deskripsi: 'Besi dan berbagai material besi',
          harga: 'Rp 2.700',
          gambar: 'assets/images/jenis_sampah/L01.png',
        ),
        SampahItem(
          kode: '501',
          nama: 'SENG',
          deskripsi: 'Seng lembaran dan berbagai potongan seng',
          harga: 'Rp 2.000',
          gambar: 'assets/images/jenis_sampah/501.png',
        ),
        SampahItem(
          kode: '502',
          nama: 'PER KASUR/KAWAT',
          deskripsi: 'Per kasur dan berbagai jenis kawat',
          harga: 'Rp 800',
          gambar: 'assets/images/jenis_sampah/502.png',
        ),
        SampahItem(
          kode: '503',
          nama: 'Tutup Botol Aluminium',
          deskripsi: 'Tutup botol berbahan aluminium',
          harga: 'Rp 2.000',
          gambar: 'assets/images/jenis_sampah/503.png',
        ),
        SampahItem(
          kode: 'T01',
          nama: 'TEMBAGA',
          deskripsi: 'Kawat tembaga',
          harga: 'Rp 40.000',
          gambar: 'assets/images/jenis_sampah/T01.png',
        ),
        SampahItem(
          kode: 'T02',
          nama: 'KUNINGAN',
          deskripsi: 'Material kuningan',
          harga: 'Rp 20.000',
          gambar: 'assets/images/jenis_sampah/T02.png',
        ),
      ],
    ),

    SampahKategori(
      nama: 'Kaca',
      items: [
        SampahItem(
          kode: '808',
          nama: 'BELING',
          deskripsi: 'Pecahan kaca, botol, dan kaca lainnya',
          harga: 'Rp 200',
          gambar: 'assets/images/jenis_sampah/808.png',
        ),
        SampahItem(
          kode: '809',
          nama: 'BOTOL INTISARI',
          deskripsi: 'Botol kaca bekas minuman',
          harga: 'Rp 400',
          gambar: 'assets/images/jenis_sampah/809.png',
        ),
        SampahItem(
          kode: '810',
          nama: 'BOTOL BIR BINTANG',
          deskripsi: 'Botol kaca bekas minuman',
          harga: 'Rp 500',
          gambar: 'assets/images/jenis_sampah/810.png',
        ),
        SampahItem(
          kode: '811',
          nama: 'Botol Kecap',
          deskripsi: 'Botol kaca bekas kecap',
          harga: 'Rp 300',
          gambar: 'assets/images/jenis_sampah/811.png',
        ),
      ],
    ),

    SampahKategori(
      nama: 'Lainnya',
      items: [
        SampahItem(
          kode: 'C01',
          nama: 'ACCU',
          deskripsi: 'Aki motor atau mobil',
          harga: 'Rp 5.000',
          gambar: 'assets/images/jenis_sampah/C01.png',
        ),
        SampahItem(
          kode: 'C02',
          nama: 'JELANTAH',
          deskripsi: 'Minyak goreng bekas yang tidak terpakai',
          harga: 'Rp 6.500',
          gambar: 'assets/images/jenis_sampah/C02.png',
        ),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) tampilkanPeringatanHarga();
    });
  }

  void tampilkanPeringatanHarga() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.fromLTRB(15, 18, 15, 8),
          content: SizedBox(
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 55),
                const SizedBox(height: 8),
                const Text(
                  'Informasi Harga Sampah',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Harga yang ditampilkan berlaku untuk sampah '
                  'yang telah dipilah berdasarkan jenisnya. Sampah '
                  'campuran dapat memiliki nilai setoran lebih rendah.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.3,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          actionsPadding: const EdgeInsets.fromLTRB(12, 5, 12, 12),
          actions: [
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(dialogContext),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF299B58),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                child: const Text(
                  'Oke, Mengerti',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget kategoriHeader(String nama) {
    return Container(
      width: double.infinity,
      height: 27,
      margin: const EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      color: teal,
      child: Text(
        nama,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget kartuSampah(SampahItem item) {
    return Container(
      height: 82,
      decoration: BoxDecoration(
        color: const Color(0xFFBED6D5),
        border: Border.all(color: const Color(0xFF477D7A), width: 0.8),
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 2,
            offset: const Offset(1, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Container(
            width: 66,
            height: 72,
            margin: const EdgeInsets.only(left: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              item.gambar,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.recycling, size: 34, color: teal);
              },
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4, 3, 4, 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item.kode,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF173C3B),
                          ),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          item.nama,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          item.deskripsi,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 8,
                            height: 1.1,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 16,
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: yellow,
                  child: Text(
                    item.harga,
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget daftarKartu(List<SampahItem> items) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 2.0,
      ),
      itemBuilder: (context, index) {
        return kartuSampah(items[index]);
      },
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
        centerTitle: true,
        toolbarHeight: 78,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Jenis Sampah',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(14, 18, 14, 25),
        itemCount: daftarKategori.length,
        itemBuilder: (context, index) {
          final kategori = daftarKategori[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kategoriHeader(kategori.nama),
                daftarKartu(kategori.items),
              ],
            ),
          );
        },
      ),
    );
  }
}
