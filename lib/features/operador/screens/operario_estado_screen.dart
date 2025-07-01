import 'package:flutter/material.dart';
import '../../../core/models/machine.dart';

class OperarioEstadoScreen extends StatelessWidget {
  OperarioEstadoScreen({super.key});

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
      estado: EstadoMaquina.mantenimiento,
    ),
    Maquinaria(
      id: 'M03',
      nombre: 'Cargador Frontal JCB',
      tipo: 'Cargador',
      estado: EstadoMaquina.ocupada,
    ),
  ];

  Color _estadoColor(EstadoMaquina estado) {
    switch (estado) {
      case EstadoMaquina.disponible:
        return Colors.green;
      case EstadoMaquina.ocupada:
        return Colors.red;
      case EstadoMaquina.mantenimiento:
        return Colors.orange;
    }
  }

  String _estadoTexto(EstadoMaquina estado) {
    switch (estado) {
      case EstadoMaquina.disponible:
        return 'Disponible';
      case EstadoMaquina.ocupada:
        return 'Ocupada';
      case EstadoMaquina.mantenimiento:
        return 'En Mantenimiento';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estado de Maquinaria'),
        backgroundColor: Colors.amber.shade800,
      ),
      body: ListView.builder(
        itemCount: maquinarias.length,
        itemBuilder: (context, index) {
          final maquina = maquinarias[index];
          return ListTile(
            leading: const Icon(Icons.build),
            title: Text(maquina.nombre),
            subtitle: Text(maquina.tipo),
            trailing: Text(
              _estadoTexto(maquina.estado),
              style: TextStyle(
                color: _estadoColor(maquina.estado),
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
} 
