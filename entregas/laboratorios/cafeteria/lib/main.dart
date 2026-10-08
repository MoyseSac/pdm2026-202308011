import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int cantidadCafe = 0;
  int cantidadJugo = 0;
  int cantidadSandwich = 0;

  double calcularTotal() {
    double total = (cantidadCafe * 10.0) + (cantidadJugo * 12.0) + (cantidadSandwich * 25.0);
    return total;
  }

  void vaciarPedido() {
    setState(() {
      cantidadCafe = 0;
      cantidadJugo = 0;
      cantidadSandwich = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.center,
            child: Text('Mi pedido'),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  ProductoPedido(
                    nombre: 'Café',
                    precio: 10.0,
                    cantidad: cantidadCafe,
                    icon: Icons.coffee,
                    onAdd: () => setState(() => cantidadCafe++),
                    onSubtract: () {
                      if (cantidadCafe > 0) {
                        setState(() => cantidadCafe--);
                      }
                    },
                  ),
                  ProductoPedido(
                    nombre: 'Jugo',
                    precio: 12.0,
                    cantidad: cantidadJugo,
                    icon: Icons.local_drink,
                    onAdd: () => setState(() => cantidadJugo++),
                    onSubtract: () {
                      if (cantidadJugo > 0) {
                        setState(() => cantidadJugo--);
                      }
                    },
                  ),
                  ProductoPedido(
                    nombre: 'Sándwich',
                    precio: 25.0,
                    cantidad: cantidadSandwich,
                    icon: Icons.bakery_dining,
                    onAdd: () => setState(() => cantidadSandwich++),
                    onSubtract: () {
                      if (cantidadSandwich > 0) {
                        setState(() => cantidadSandwich--);
                      }
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey, width: 1)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(
                        'Q${calcularTotal().toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF42A5F5)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: vaciarPedido,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text('Vaciar pedido', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductoPedido extends StatelessWidget {
  final String nombre;
  final double precio;
  final int cantidad;
  final IconData icon;
  final VoidCallback onAdd;
  final VoidCallback onSubtract;

  const ProductoPedido({
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.icon,
    required this.onAdd,
    required this.onSubtract,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF42A5F5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(nombre, style: const TextStyle(color: Color(0xFF42A5F5), fontWeight: FontWeight.bold)),
        subtitle: Text('Q${precio.toStringAsFixed(2)}', style: const TextStyle(color: Color(0xFF42A5F5))),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: onSubtract,
              child: const Text('−'),
            ),
            SizedBox(
              width: 40,
              child: Center(
                child: Text(
                  cantidad.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: onAdd,
              child: const Text('+'),
            ),
          ],
        ),
      ),
    );
  }
}
