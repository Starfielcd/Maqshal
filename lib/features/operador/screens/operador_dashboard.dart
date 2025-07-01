import 'package:flutter/material.dart';
import 'operario_maquinaria_screen.dart';
import 'operario_estado_screen.dart';


class OperadorDashboard extends StatelessWidget {
  const OperadorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel Operario'),
        backgroundColor: Colors.amber.shade800,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bienvenido, Operario',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OperarioMaquinariaScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.construction),
              label: const Text('Maquinaria Disponible'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OperarioEstadoScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.info_outline),
              label: const Text('Estado de Maquinaria'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
