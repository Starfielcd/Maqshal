import 'package:flutter/material.dart';

class SupervisorEstadoGeneralScreen extends StatelessWidget {
  const SupervisorEstadoGeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estado General'),
        backgroundColor: const Color.fromARGB(255, 38, 50, 56),
      ),
      body: Stack(
        children: [
          // Imagen de fondo
          Image.asset(
            'assets/images/maquinaria.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Capa oscura para contraste
          Container(
            color: Colors.black.withOpacity(0.4),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ESTADO GENERAL DE MAQUINARIA',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Consulta rápida del estado, asignación por turno y mantenimientos pendientes:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),

                // Lista simulada de maquinaria con estado
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white.withOpacity(0.9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: const Icon(Icons.precision_manufacturing, color: Colors.black),
                          title: Text(
                            'Maquinaria ${index + 1}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Estado: Operativa', style: TextStyle(color: Colors.black54)),
                              Text('Turno asignado: Noche', style: TextStyle(color: Colors.black54)),
                              Text('Mantenimiento pendiente: No', style: TextStyle(color: Colors.black54)),
                            ],
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.info_outline, color: Colors.black),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: const Text('Detalle de Maquinaria'),
                                  content: const Text(
                                    'Aquí podrías mostrar más detalles técnicos, mantenimientos, o historial de uso.',
                                  ),
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
