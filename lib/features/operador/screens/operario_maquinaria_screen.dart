import 'package:flutter/material.dart';

class OperarioMaquinariaScreen extends StatelessWidget {
  const OperarioMaquinariaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Maquinarias'),
        backgroundColor: const Color.fromARGB(255, 38, 50, 56),
      ),
      body: Stack(
        children: [
          // Imagen de fondo con fallback
          Positioned.fill(
            child: Image.asset(
              'assets/images/maquinaria.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade800,
                  child: const Center(
                    child: Icon(Icons.broken_image, color: Colors.white54, size: 80),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'MAQUINARIAS DISPONIBLES',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Consulta las maquinarias disponibles para tu uso:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white.withOpacity(0.9),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.precision_manufacturing, color: Colors.black),
                          title: Text(
                            'Maquinaria ${index + 1}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: const Text(
                            'Estado: Disponible',
                            style: TextStyle(color: Colors.black54),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.info_outline, color: Colors.black),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: const Text('Detalle de Maquinaria'),
                                  content: Text('Información de la Maquinaria ${index + 1}.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Cerrar'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
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
