import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const kFondo = Color(0xFFF3F4F6);
const kSuperficie = Color(0xFFFFFFFF);
const kBorde = Color(0xFFE5E7EB);
const kTexto = Color(0xFF14181B);
const kMuted = Color(0xFF6B7280);
const kLima = Color(0xFFC8F54E);
const kIconoFondo = Color(0xFFEFEFF0);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Neobank',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: kFondo,
        colorScheme: .fromSeed(seedColor: kLima, brightness: Brightness.light),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: kFondo,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good morning, Terry',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kTexto,
                ),
              ),
              Text(
                'Welcome to Neobank',
                style: TextStyle(fontSize: 12, color: kMuted),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: kSuperficie,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.notifications_none, color: kTexto),
                      tooltip: 'Notificaciones',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('This is a notification'),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: kLima,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            Card(
              color: kSuperficie,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Your balance', style: TextStyle(color: kMuted)),
                        Icon(Icons.visibility_off_outlined, color: kMuted),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$3,200.00',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: kTexto,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kTexto,
                          foregroundColor: kSuperficie,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Add money'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Text(
                  'Your cards',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: kTexto,
                  ),
                ),
                const Spacer(),
                Icon(Icons.add, color: kTexto, size: 18),
                const SizedBox(width: 4),
                Text(
                  'New card',
                  style: TextStyle(fontWeight: FontWeight.w600, color: kTexto),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                bankCard('N.', 'Debit Card', '•••• 4568', kLima, kTexto),
                const SizedBox(width: 16),
                bankCard(
                  'N.',
                  'Credit Card',
                  '•••• 1234',
                  kTexto,
                  kSuperficie,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transactions',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: kTexto,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('See all', style: TextStyle(color: kMuted)),
                ),
              ],
            ),
            transactionTile(
              Icons.local_cafe,
              'Starbucks Coffee',
              'October 17, 09:00 PM',
              '-\$44.80',
              '+\$1.65',
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: kSuperficie,
          selectedItemColor: kTexto,
          unselectedItemColor: kMuted,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: 'Map',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz),
              label: 'Transfer',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: kLima, width: 2),
                ),
                child: const Icon(Icons.account_circle),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

Widget bankCard(
  String initials,
  String type,
  String maskedNumber,
  Color background,
  Color foreground,
) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                initials,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: foreground,
                ),
              ),
              SizedBox(
                width: 30,
                height: 20,
                child: Stack(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEB001B),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Positioned(
                      left: 10,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF79E1B),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text(type, style: TextStyle(fontSize: 12, color: foreground)),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                maskedNumber,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: foreground,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: kSuperficie,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.remove_red_eye_outlined,
                      size: 14,
                      color: kTexto,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Details',
                      style: TextStyle(fontSize: 12, color: kTexto),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget transactionTile(
  IconData icon,
  String title,
  String subtitle,
  String amount,
  String cashback,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: const BoxDecoration(
            color: kIconoFondo,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: kTexto),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w600, color: kTexto),
              ),
              const SizedBox(height: 4),
              Text(subtitle, style: TextStyle(fontSize: 12, color: kMuted)),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              amount,
              style: TextStyle(fontWeight: FontWeight.w600, color: kTexto),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: kLima,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                cashback,
                style: TextStyle(fontSize: 10, color: kTexto),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
