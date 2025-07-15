import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intento3/features/auth/screens/login_screen.dart';

// ✅ Importa tus nuevas pantallas
import 'mecanico_mantenimiento_screen.dart';
import 'mecanico_historial_screen.dart';
import 'mecanico_almacen_screen.dart';

class MecanicoDashboardScreen extends StatelessWidget {
  const MecanicoDashboardScreen({super.key});

  // BOTÓN CIRCULAR BLANCO
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

  // LOGOUT
  Future<void> _logout(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 38, 50, 56),
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/images/maquinaria.jpg',
              height: 40,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'MaqCSHAL',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'MineControl',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.notifications, color: Colors.red, size: 30),
          ],
        ),
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
              children: [
                const SizedBox(height: 20),
                const Text(
                  'BIENVENIDO',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'MECÁNICO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                // GRID DE OPCIONES
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: [
                      _buildActionButton(
                        context,
                        icon: Icons.build_circle,
                        label: 'MANTENIMIENTO',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const MecanicoMantenimientoScreen(),
                            ),
                          );
                        },
                      ),
                      _buildActionButton(
                        context,
                        icon: Icons.history,
                        label: 'HISTORIAL MECÁNICO',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const MecanicoHistorialScreen(),
                            ),
                          );
                        },
                      ),
                      _buildActionButton(
                        context,
                        icon: Icons.warehouse,
                        label: 'ALMACÉN',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const MecanicoAlmacenScreen(),
                            ),
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 38, 50, 56),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Acerca de',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Cerrar Sesión',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              // Lógica para Perfil
              break;
            case 1:
              // Lógica para Acerca de
              break;
            case 2:
              _logout(context);
              break;
          }
        },
      ),
    );
  }
}
