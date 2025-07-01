import 'package:flutter/material.dart';

class SupervisorDashboard extends StatelessWidget {
  const SupervisorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Panel Operario')),
      body: const Center(child: Text('Bienvenido, Supervisor')),
    );
  }
}