import 'package:material_ui/material_ui.dart';

class KategoriPlastikScreen extends StatefulWidget {
  const KategoriPlastikScreen({super.key});

  @override
  State<KategoriPlastikScreen> createState() => _KategoriPlastikScreenState();
}

class _KategoriPlastikScreenState extends State<KategoriPlastikScreen> {
  static const Color teal = Color(0xFF5B8E8B);
  static const Color background = Color(0xFFEEEEEE);
  static const Color yellow = Color(0xFFF5D77C);

  final List<String> kodePlastik = [
    'POS',
    'P06',
    'P07',
    'P08',
    'P09',
    'P10',
    'P11',
    'P12',
    'P14',
    'P17',
    'P20',
    'P21',
    'P22',
    'P23',
    'P25',
    'P26',
    'P29',
    'P31',
    'P35',
    'P37',
    'P38',
  ];

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
        title: const Text(
          'Jenis Sampah Plastik',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
            decoration: const BoxDecoration(
              color: teal,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: const Text(
              'Pilih jenis sampah plastik yang ingin kamu lihat.',
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 10),
            child: Row(
              children: [
                const Text(
                  'Kategori Plastik',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  '${kodePlastik.length} jenis',
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
              itemCount: kodePlastik.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.88,
              ),
              itemBuilder: (context, index) {
                final kode = kodePlastik[index];

                return _KartuJenisPlastik(
                  kode: kode,
                  teal: teal,
                  yellow: yellow,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _KartuJenisPlastik extends StatelessWidget {
  final String kode;
  final Color teal;
  final Color yellow;

  const _KartuJenisPlastik({
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
