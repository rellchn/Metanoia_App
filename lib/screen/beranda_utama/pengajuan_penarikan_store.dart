import 'package:material_ui/material_ui.dart';

class PengajuanPenarikan {
  final String waktu;
  final String tanggal;
  final int nominal;
  final String catatan;
  bool sudahDibaca;

  PengajuanPenarikan({
    required this.waktu,
    required this.tanggal,
    required this.nominal,
    this.catatan = '',
    this.sudahDibaca = false,
  });
}

class PengajuanPenarikanStore {
  static final ValueNotifier<List<PengajuanPenarikan>> daftar =
      ValueNotifier<List<PengajuanPenarikan>>([]);

  static void tambah({required int nominal, String catatan = ''}) {
    final sekarang = DateTime.now();

    final pengajuan = PengajuanPenarikan(
      waktu:
          '${sekarang.hour.toString().padLeft(2, '0')}:'
          '${sekarang.minute.toString().padLeft(2, '0')}',
      tanggal:
          '${sekarang.day.toString().padLeft(2, '0')}/'
          '${sekarang.month.toString().padLeft(2, '0')}/'
          '${sekarang.year}',
      nominal: nominal,
      catatan: catatan,
    );

    daftar.value = [pengajuan, ...daftar.value];
  }

  static void tandaiDibaca(PengajuanPenarikan pengajuan) {
    pengajuan.sudahDibaca = true;
    daftar.value = [...daftar.value];
  }

  static int get jumlahBelumDibaca {
    return daftar.value.where((item) => !item.sudahDibaca).length;
  }
}
