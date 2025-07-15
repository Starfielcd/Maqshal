import 'package:flutter/material.dart';

class OperarioActividadesScreen extends StatelessWidget {
  const OperarioActividadesScreen({super.key});

  // ✅ Botón de acción circular profesional
  Widget _buildActionButton(BuildContext context,
      {required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Icon(icon, size: 60, color: Colors.blueGrey[800]),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actividades del Operario'),
        backgroundColor: const Color.fromARGB(255, 38, 50, 56),
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          // Fondo con imagen
          Image.asset(
            'assets/images/maquinaria.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Capa oscura para legibilidad
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          // Contenido principal
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'ACTIVIDADES DEL OPERARIO',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Selecciona la acción que deseas realizar:',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: [
                      _buildActionButton(
                        context,
                        icon: Icons.play_circle_fill,
                        label: 'Empezar Uso\nde Maquinaria',
                        onTap: () {
                          print('Empezar uso de maquinaria');
                          // Aquí puedes navegar a la pantalla o lógica real
                        },
                      ),
                      _buildActionButton(
                        context,
                        icon: Icons.logout,
                        label: 'Registrar\nFin de Turno',
                        onTap: () {
                          print('Registrar fin de turno');
                        },
                      ),
                      _buildActionButton(
                        context,
                        icon: Icons.note_add,
                        label: 'Registrar\nReporte de Uso',
                        onTap: () {
                          print('Registrar reporte de uso');
                        },
                      ),
                    ],
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
