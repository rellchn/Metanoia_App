import 'package:material_ui/material_ui.dart';

class KategoriSampahScreen extends StatefulWidget {
  final String namaKategori;
  final List<String> daftarKode;

  const KategoriSampahScreen({
    super.key,
    required this.namaKategori,
    required this.daftarKode,
  });

  @override
  State<KategoriSampahScreen> createState() => _KategoriSampahScreenState();
}

class _KategoriSampahScreenState extends State<KategoriSampahScreen> {
  static const Color teal = Color(0xFF5B8E8B);
  static const Color background = Color(0xFFEEEEEE);
  static const Color yellow = Color(0xFFF5D77C);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _tampilkanPeringatan();
    });
  }

  void _tampilkanPeringatan() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          title: const Row(
            children: [
              Icon(Icons.info_outline, color: teal, size: 25),
              SizedBox(width: 9),
              Expanded(
                child: Text(
                  'Informasi Harga Sampah',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          content: const Text(
            'Harga yang ditampilkan berlaku untuk sampah '
            'yang telah dipilah berdasarkan jenisnya. '
            'Sampah campuran dapat memiliki nilai setoran '
            'lebih rendah.',
            style: TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: teal,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Oke, Mengerti'),
              ),
            ),
          ],
        );
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
        title: Text(
          'Kategori ${widget.namaKategori}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 16),
        itemCount: widget.daftarKode.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 2.5,
        ),
        itemBuilder: (context, index) {
          final kode = widget.daftarKode[index];

          return _KartuJenisSampah(kode: kode, teal: teal, yellow: yellow);
        },
      ),
    );
  }
}

class _KartuJenisSampah extends StatelessWidget {
  final String kode;
  final Color teal;
  final Color yellow;

  const _KartuJenisSampah({
    required this.kode,
    required this.teal,
    required this.yellow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: const Color(0xFFBDBDBD)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Image.asset(
                'assets/images/jenis_sampah/$kode.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.recycling,
                    color: Color(0xFF9DB8B7),
                    size: 35,
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2, 3, 2, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          kode,
                          style: TextStyle(
                            color: teal,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Nama dan deskripsi jenis sampah',
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 8, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: yellow,
                  padding: const EdgeInsets.symmetric(
                    vertical: 3,
                    horizontal: 2,
                  ),
                  child: const Text(
                    'Harga: Belum tersedia',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 7,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
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
}
