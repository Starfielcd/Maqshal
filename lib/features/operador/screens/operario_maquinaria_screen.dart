import 'package:flutter/material.dart';
import '../../../core/models/machine.dart';

class OperarioMaquinariaScreen extends StatelessWidget {
  OperarioMaquinariaScreen({super.key});

  final List<Maquinaria> maquinarias = [
    Maquinaria(
      id: 'M01',
      nombre: 'Excavadora CAT 320',
      tipo: 'Excavadora',
      estado: EstadoMaquina.disponible,
    ),
    Maquinaria(
      id: 'M02',
      nombre: 'Retroexcavadora Komatsu',
      tipo: 'Retroexcavadora',
      estado: EstadoMaquina.disponible,
    ),
    Maquinaria(
      id: 'M03',
      nombre: 'Cargador Frontal JCB',
      tipo: 'Cargador',
      estado: EstadoMaquina.ocupada,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maquinaria Disponible'),
        backgroundColor: Colors.amber.shade800,
      ),
      body: ListView.builder(
        itemCount: maquinarias.length,
        itemBuilder: (context, index) {
          final maquina = maquinarias[index];
          final esDisponible = maquina.estado == EstadoMaquina.disponible;

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: esDisponible ? Colors.white : Colors.grey.shade300,
            child: ListTile(
              title: Text(
                maquina.nombre,
                style: TextStyle(
                  color: esDisponible ? Colors.black : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(maquina.tipo),
              trailing: esDisponible
                  ? ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Usando ${maquina.nombre}')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                      ),
                      child: const Text('Usar'),
                    )
                  : const Text(
                      'Ocupada',
                      style: TextStyle(color: Colors.red),
                    ),
            ),
          );
        },
      ),
    );
  }
}
