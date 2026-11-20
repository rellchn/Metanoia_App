import 'package:material_ui/material_ui.dart';

class AppBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const AppBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF5B8E8B);
    const grey = Color(0xFF999999);

    Widget navItem(IconData icon, String label, int index) {
      final selected = selectedIndex == index;

      return Expanded(
        child: InkWell(
          onTap: () => onTap(index),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 25, color: selected ? teal : grey),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(fontSize: 9, color: selected ? teal : grey),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      height: 68,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          navItem(Icons.home_outlined, 'Beranda', 0),
          navItem(Icons.history, 'Riwayat', 1),
          Expanded(
            child: Center(
              child: Transform.translate(
                offset: const Offset(0, -12),
                child: InkWell(
                  onTap: () => onTap(2),
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: teal,
                      shape: BoxShape.circle,
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.qr_code_scanner,
                          color: Colors.white,
                          size: 31,
                        ),
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
            ),
          ),
          navItem(Icons.info_outline, 'Informasi', 3),
          navItem(Icons.person_outline, 'Saya', 4),
        ],
      ),
    );
  }
}
