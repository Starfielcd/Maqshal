// Importa la librería de Firebase Authentication
import 'package:firebase_auth/firebase_auth.dart'; 
import 'package:cloud_firestore/cloud_firestore.dart';



// Importa los widgets y herramientas de Flutter
import 'package:flutter/material.dart'; 

// Importa tu modelo de usuario (con la definición de RolUsuario)
import '../../../core/models/user.dart'; 

// Importa las pantallas a donde se redirige según el rol elegido
import '../../jefe/screens/jefe_dashboard.dart'; 
import '../../mecanico/screens/mecanico_dashboard.dart'; 
import '../../operador/screens/operador_dashboard.dart'; 
import '../../supervisor/screens/supervisor_dashboard.dart'; 

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _identificador = '';  // Almacena el correo o DNI ingresado
  String _passwordInput = '';  // Almacena la contraseña ingresada
  RolUsuario? _rolSeleccionado;  // Rol elegido en el Dropdown
  bool _verContrasena = false;   // Controla la visibilidad del campo de contraseña
  bool _isLoading = false;       // Muestra un spinner de carga mientras se valida
  String? _correoError;          // Guarda el mensaje de error del campo identificador

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          DropdownButtonFormField<RolUsuario>(
            value: _rolSeleccionado,
            items: RolUsuario.values.map((rol) {
              return DropdownMenuItem(
                value: rol,
                child: Text(rol.toString().split('.').last.toUpperCase()),
              );
            }).toList(),
            onChanged: (valor) => setState(() => _rolSeleccionado = valor),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.amber,
              hintText: 'Seleccione su rol',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.amber,
                  hintText: 'Correo o DNI',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onChanged: (val) {
                  setState(() {
                    _identificador = val.trim();
                    _correoError = _validarIdentificador(val);
                  });
                },
              ),
              if (_correoError != null)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _correoError!,
                          style: const TextStyle(color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            obscureText: !_verContrasena,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.amber,
              hintText: 'Contraseña',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              suffixIcon: IconButton(
                icon: Icon(_verContrasena ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() => _verContrasena = !_verContrasena),
              ),
            ),
            onChanged: (val) => _passwordInput = val,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _isLoading ? null : _login,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber.shade800,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: _isLoading
                ? const CircularProgressIndicator(color: Colors.black)
                : const Text(
                    'Ingresar',
                    style: TextStyle(color: Colors.black),
                  ),
          ),
        ],
      ),
    );
  }

  String? _validarIdentificador(String val) {
    if (val.isEmpty) return 'Este campo es obligatorio.';

    if (RegExp(r'^\d{8}$').hasMatch(val)) {
      return null;
    }

    if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.[a-zA-Z]{2,}$').hasMatch(val)) {
      return 'Correo no válido.';
    }

    return null;
  }

  void _login() async {
    final ctx = context;

    if (_rolSeleccionado == null || _correoError != null) {
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(content: Text('Corrige los errores antes de continuar.')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      String emailParaLogin = _identificador;

      if (RegExp(r'^\d{8}$').hasMatch(_identificador)) {
        final snapshot = await FirebaseFirestore.instance
            .collection('usuarios')
            .where('dni', isEqualTo: _identificador)
            .limit(1)
            .get();

        if (snapshot.docs.isEmpty) {
          setState(() => _isLoading = false);
          ScaffoldMessenger.of(ctx).showSnackBar(
            const SnackBar(content: Text('DNI no encontrado en la base de datos.')),
          );
          return;
        }

        final data = snapshot.docs.first.data();
        if (data['correo'] == null || data['correo'].toString().isEmpty) {
          setState(() => _isLoading = false);
          ScaffoldMessenger.of(ctx).showSnackBar(
            const SnackBar(content: Text('El usuario no tiene correo registrado.')),
          );
          return;
        }

        emailParaLogin = data['correo'];
      }

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailParaLogin,
        password: _passwordInput,
      );

      setState(() => _isLoading = false);

      Navigator.pushReplacement(
        ctx,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => _pantallaPorRol(_rolSeleccionado!),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 500),
        ),
      );
    } on FirebaseAuthException catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(content: Text('Error de autenticación: ${e.message}')),
      );
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(content: Text('Error inesperado: $e')),
      );
    }
  }

  Widget _pantallaPorRol(RolUsuario rol) {
    switch (rol) {
      case RolUsuario.operario:
        return const OperadorDashboard();
      case RolUsuario.mecanico:
        return const MecanicoDashboardScreen();
      case RolUsuario.supervisor:
        return const SupervisorDashboard();
      case RolUsuario.jefe:
        return const JefeDashboard();
    }
  }
}
