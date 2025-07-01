import 'package:flutter/material.dart';

class JefeDashboard extends StatelessWidget {
  const JefeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Panel Operario')),
      body: const Center(child: Text('Bienvenido, Jefe de Operaciones')),
    );
  }
}