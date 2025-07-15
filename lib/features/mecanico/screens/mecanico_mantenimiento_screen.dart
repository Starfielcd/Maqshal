import 'package:flutter/material.dart';

class MecanicoMantenimientoScreen extends StatelessWidget {
  const MecanicoMantenimientoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mantenimiento Mecánico'),
        backgroundColor: const Color.fromARGB(255, 38, 50, 56),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/maquinaria.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ACTIVIDADES DE MANTENIMIENTO',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Seleccione la acción que desea realizar:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 30),

                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: [
                      _buildActionButton(
                        context,
                        icon: Icons.build,
                        label: 'Registrar\nMantenimiento',
                        onTap: () {
                          // Acción para registrar mantenimiento
                          _showSimpleDialog(
                            context,
                            'Registrar Mantenimiento',
                            'Aquí podrás registrar un mantenimiento realizado.',
                          );
                        },
                      ),
                      _buildActionButton(
                        context,
                        icon: Icons.schedule,
                        label: 'Programar\nMantenimiento',
                        onTap: () {
                          // Acción para programar mantenimiento
                          _showSimpleDialog(
                            context,
                            'Programar Mantenimiento',
                            'Aquí podrás programar mantenimientos futuros.',
                          );
                        },
                      ),
                      _buildActionButton(
                        context,
                        icon: Icons.precision_manufacturing,
                        label: 'Estado de\nMaquinaria',
                        onTap: () {
                          // Acción para consultar estado
                          _showSimpleDialog(
                            context,
                            'Estado de Maquinaria',
                            'Consulta el estado operativo actual de la maquinaria.',
                          );
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

  Widget _buildActionButton(BuildContext context, {required IconData icon, required String label, required VoidCallback onTap}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Icon(icon, size: 48, color: Colors.black),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  void _showSimpleDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }
}
