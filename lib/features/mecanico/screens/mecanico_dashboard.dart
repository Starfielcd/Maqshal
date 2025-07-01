import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // <--- Importación necesaria para SharedPreferences
import 'package:intento3/features/auth/screens/login_screen.dart'; // <--- Importación necesaria para LoginScreen.
                                                                //      Asegúrate que esta RUTA sea CORRECTA para tu LoginScreen.


class MecanicoDashboardScreen extends StatelessWidget {
  // Esta es la ÚNICA declaración de _buildActionButton que debe existir.
  // La he colocado aquí para que esté dentro de la clase pero fuera del método build.
  Widget _buildActionButton(BuildContext context, {required IconData icon, required String label}) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Lógica para el botón (puedes agregar navegación aquí en el futuro)
            print('Botón $label presionado'); // Solo para depuración
          },
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Icon(icon, size: 60, color: Colors.blueGrey[800]),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // Función para cerrar sesión
  Future<void> _logout(BuildContext context) async {
    // 1. Limpiar datos de sesión (ej. token de usuario)
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Esto borrará todas las preferencias guardadas por la app.
                         // Si solo quieres borrar un token específico, usa await prefs.remove('nombre_de_tu_token');

    // 2. Navegar a la pantalla de inicio de sesión
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (Route<dynamic> route) => false, // Elimina todas las rutas anteriores para que no se pueda volver atrás.
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Colores de la AppBar y BottomNavigationBar
        backgroundColor: const Color.fromARGB(255, 38, 50, 56), // Un tono oscuro para la AppBar
        elevation: 0,
        title: Row(
          children: [
            // Icono del logo y texto "MaqCSHAL MineControl"
            Image.asset(
              'assets/images/maquinaria.jpg', // Asegúrate de que esta ruta sea correcta y que la imagen esté en pubspec.yaml
              height: 40,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
            Spacer(),
            // Barra de búsqueda
            Container(
              width: 120,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'buscar...',
                  hintStyle: TextStyle(color: Colors.white70),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder( // Necesario para el estado normal
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder( // Opcional, para cuando el campo está enfocado
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.yellow),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10)
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(width: 8),
            // Icono de notificación
            Stack(
              children: [
                Icon(Icons.notifications, color: Colors.red, size: 30),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: Text(
                      '!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
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
          Column(
            children: [
              SizedBox(height: 20),
              Text(
                'BIENVENIDO',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'MECANICO',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton( // Llamando a la función _buildActionButton
                    context,
                    icon: Icons.build_circle,
                    label: 'MANTENIMIENTO',
                  ),
                  _buildActionButton( // Llamando a la función _buildActionButton
                    context,
                    icon: Icons.history,
                    label: 'HISTORIAL MECÁNICO',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 38, 50, 56), // Un tono oscuro para la BottomNavigationBar
        selectedItemColor: Colors.white, // Los iconos/texto seleccionados serán blancos
        unselectedItemColor: Colors.white70, // Los no seleccionados serán un blanco tenue
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
            label: 'Cerrar Sesion',
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
              _logout(context); // Llama a la función de cerrar sesión
              break;
          }
        },
      ),
    );
  }
}