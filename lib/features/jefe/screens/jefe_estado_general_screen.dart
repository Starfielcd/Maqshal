import 'package:flutter/material.dart';

class JefeEstadoGeneralScreen extends StatelessWidget {
  const JefeEstadoGeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estado General de Operaciones'),
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
          Container(color: Colors.black.withOpacity(0.4)),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ESTADO GENERAL',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Visualiza el estado operativo global de todas las maquinarias y turnos:',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: List.generate(6, (index) {
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
                            'Estado operativo: Activo',
                            style: TextStyle(color: Colors.black54),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.info_outline, color: Colors.black),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: const Text('Detalle de Estado'),
                                  content: Text('Información detallada de Maquinaria ${index + 1}.'),
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
                    }),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
