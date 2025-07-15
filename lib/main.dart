import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intento3/firebase_options.dart';  // Asegúrate de que este archivo esté en la carpeta lib
import 'features/auth/screens/login_screen.dart';
import 'features/operador/screens/operador_dashboard.dart';
import 'features/mecanico/screens/mecanico_dashboard.dart';
import 'features/supervisor/screens/supervisor_dashboard.dart';
import 'features/jefe/screens/jefe_dashboard.dart';

Future<void> main() async {
  // Asegura que el motor de Flutter se haya inicializado antes de ejecutar Firebase
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa Firebase con las configuraciones de la plataforma específica
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,  // Este archivo debe estar generado
  );

  // Inicia la aplicación una vez Firebase esté inicializado
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaqCSHAL - MineControl',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),  // Ruta de inicio de sesión
        '/operador': (context) => const OperadorDashboard(),  // Ruta para operador
        '/mecanico': (context) => MecanicoDashboardScreen(),  // Ruta para mecánico
        '/supervisor': (context) => const SupervisorDashboard(),  // Ruta para supervisor
        '/jefe': (context) => const JefeDashboard(),  // Ruta para jefe
      },
    );
  }
}