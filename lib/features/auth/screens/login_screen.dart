import 'package:flutter/material.dart';
import 'forgot_password_screen.dart'; // ✅ Importación directa

import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          SizedBox.expand(
            child: Image.asset(
              'assets/images/maquinaria.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Capa oscura encima
          Container(
            color: Colors.black.withOpacity(0.5),
          ),

          // Contenido principal
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LogoHeader(),
                  const SizedBox(height: 20),
                  const LoginForm(),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "¿Olvidaste tu contraseña?",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LogoHeader extends StatelessWidget {
  const LogoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.settings, color: Colors.amber, size: 48),
            SizedBox(width: 6),
            Text(
              'MaqCSHAL',
              style: TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
          ],
        ),
        const Text(
          'MineControl',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w500,
            color: Colors.amber,
          ),
        ),
        const SizedBox(height: 50),
        const Text(
          'BIENVENIDO',
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
        const Text(
          'INICIAR SESIÓN',
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
