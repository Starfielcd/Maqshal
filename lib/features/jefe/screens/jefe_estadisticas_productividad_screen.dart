import 'package:flutter/material.dart';

class JefeEstadisticasProductividadScreen extends StatelessWidget {
  const JefeEstadisticasProductividadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estadísticas de Productividad'),
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
                  'ESTADÍSTICAS DE PRODUCTIVIDAD',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Analiza indicadores clave de productividad de maquinarias y turnos:',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      _buildStatCard('Uso promedio por turno', '7.5 horas', Icons.access_time),
                      _buildStatCard('Mantenimientos programados', '12', Icons.build),
                      _buildStatCard('Operarios activos', '18', Icons.person),
                      _buildStatCard('Maquinarias en operación', '24', Icons.precision_manufacturing),
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

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Card(
      color: Colors.white.withOpacity(0.9),
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        trailing: Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
