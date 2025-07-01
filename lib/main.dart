import 'package:flutter/material.dart';
import 'features/auth/screens/login_screen.dart';
import 'features/operador/screens/operador_dashboard.dart';
import 'features/mecanico/screens/mecanico_dashboard.dart';
import 'features/supervisor/screens/supervisor_dashboard.dart';
import 'features/jefe/screens/jefe_dashboard.dart';

void main() {
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
        '/': (context) => const LoginScreen(),
        '/operador': (context) => const OperadorDashboard(),
        '/mecanico': (context) => MecanicoDashboardScreen(),
        '/supervisor': (context) => const SupervisorDashboard(),
        '/jefe': (context) => const JefeDashboard(),
      },
    );
  }
}
