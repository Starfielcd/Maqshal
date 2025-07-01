//importacion de paquetes
import 'package:flutter/material.dart';//importacion de paquetes
import '../../../core/models/user.dart';//archivos internos
import '../../jefe/screens/jefe_dashboard.dart';
import '../../mecanico/screens/mecanico_dashboard.dart';
import '../../operador/screens/operador_dashboard.dart';
import '../../supervisor/screens/supervisor_dashboard.dart';//archivos internos


// Clase que representa el formulario de inicio de sesión
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();// Crea el estado del formulario

}
 
// Clase que maneja el estado del LoginForm
class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _identificador = ''; // Correo o DNI
  String _passwordInput = '';// Contraseña ingresada por el usuario
  RolUsuario? _rolSeleccionado;// Rol seleccionado por el usuario
  bool _verContrasena = false;// Control para mostrar u ocultar la contraseña
  bool _isLoading = false;// Control para indicar si el login está en proceso
  String? _correoError;// Mensaje de error asociado al campo del identificador


  // Lista de usuarios simulada (en una app real se reemplazaría por una base de datos)
  final _usuarios = [
    Usuario(
      id: '1',
      nombre: 'Ciriaco',
      dni: '44332211',
      contrasena: '123456',
      correo: 'ciriaco@maqcshal.com',
      rol: RolUsuario.jefe,
    ),
    Usuario(
      id: '2',
      nombre: 'Veli',
      dni: '12312312',
      contrasena: '123456',
      correo: 'veli@maqcshal.com',
      rol: RolUsuario.operario,
    ),
    Usuario(
      id: '3',
      nombre: 'poma',
      dni: '11223344',
      contrasena: '123456',
      correo: 'poma@maqcshal.com',
      rol: RolUsuario.mecanico,
    ),
    Usuario(
      id: '4',
      nombre: 'Sanchez',
      dni: '12345678',
      contrasena: '123456',
      correo: 'sanchez@maqcshal.com',
      rol: RolUsuario.supervisor,
    ),

  ];

  // Método que construye la interfaz del formulario
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,// Asocia la clave de formulario para validaciones
      child: Column(
        children: [ // Dropdown para seleccionar el rol del usuario
          DropdownButtonFormField<RolUsuario>(
            value: _rolSeleccionado,// Muestra el rol seleccionado
            items: RolUsuario.values.map((rol) {
              return DropdownMenuItem(
                value: rol,
                child: Text(rol.nombre.toUpperCase()),// Muestra el nombre del rol en mayúsculas
              );
            }).toList(),
            onChanged: (valor) => setState(() => _rolSeleccionado = valor),// Cambia el rol seleccionado al nuevo valor
            decoration: const InputDecoration(
              filled: true, // Fondo relleno del campo
              fillColor: Colors.amber, // Color de fondo amarillo
              labelText: 'Seleccione su rol', // Texto del label del Dropdown
            ),
          ),
          const SizedBox(height: 10), // Campo para ingresar el identificador (correo o DNI)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  filled: true,// Fondo relleno
                  fillColor: Colors.amber,
                  labelText: 'Correo o DNI',
                ),
                onChanged: (val) {
                  setState(() {
                    _identificador = val.trim();
                    _correoError = _validarIdentificador(val);
                  });
                },
              ),
              if (_correoError != null)  // Muestra un error si el identificador no es válido
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color:  const Color.fromARGB(255, 255, 255, 255),
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
                      const Icon(Icons.warning_amber_rounded,
                          color: Colors.orange, size: 20),
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
          const SizedBox(height: 10), // Campo para ingresar la contraseña
          TextFormField(
            obscureText: !_verContrasena,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.amber,
              labelText: 'Contraseña',
              suffixIcon: IconButton(
                icon: Icon(_verContrasena
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () =>
                    setState(() => _verContrasena = !_verContrasena),
              ),
            ),
            onChanged: (val) => _passwordInput = val,// Asigna el valor de la contraseña
          ),
          const SizedBox(height: 20),// Botón para iniciar sesión
          ElevatedButton(
            onPressed: _isLoading ? null : _login,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber.shade800,
              padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
            child: _isLoading
                ? const CircularProgressIndicator(color: Colors.black)
                : const Text('Ingresar',
                    style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
// Método para validar el correo o DNI
  String? _validarIdentificador(String val) {
    if (val.isEmpty) return 'Este campo es obligatorio.';// Si está vacío
    if (RegExp(r'^\d{8}$').hasMatch(val)) return null; // DNI válido 8
    if (!val.contains('@')) return "Incluye una '@' en el correo.";// Valida el formato de correo
    if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.[a-zA-Z]{2,4}\$').hasMatch(val)) {
      return 'Correo no válido.';// Valida formato completo de correo
    }
    return null;
  }
  // Método para realizar el login

  void _login() async {
    if (_rolSeleccionado == null || _correoError != null) {  // Si no se seleccionó rol o hay errores, muestra un mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Corrige los errores antes de continuar.')),
      );
      return;
    }

    setState(() => _isLoading = true);// Activa el estado de carga
    await Future.delayed(const Duration(seconds: 2)); // Simula un retraso para el login

    // Busca al usuario en la lista según el rol, correo o DNI y contraseña
    final usuario = _usuarios.firstWhere(
      (u) =>
          u.rol == _rolSeleccionado &&
          (u.dni == _identificador || u.correo == _identificador) &&
          u.contrasena == _passwordInput,
      orElse: () => Usuario(
        id: '',
        nombre: '',
        dni: '',
        contrasena: '',
        correo: '',
        rol: RolUsuario.operario, // Usuario vacío si no se encuentra
      ),
    );

    setState(() => _isLoading = false);// Desactiva el estado de carga

    if (usuario.id == '') {  // Si no se encuentra el usuario, muestra un mensaje de credenciales inválidas
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Credenciales inválidas.')),
      );
      return;
    }
// Si las credenciales son válidas, redirige a la pantalla correspondiente

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(// Redirige a la pantalla del rol del usuario
        pageBuilder: (_, __, ___) => _pantallaPorRol(usuario.rol),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);// Animación de transición
        },
        transitionDuration: const Duration(milliseconds: 500),// Duración de la animación

      ),
    );
  }
  // Devuelve la pantalla correspondiente según el rol del usuario

  Widget _pantallaPorRol(RolUsuario rol) {
    switch (rol) {
      case RolUsuario.operario:
        return const OperadorDashboard();// Si es operario, redirige a
      case RolUsuario.mecanico:
        return MecanicoDashboardScreen();
      case RolUsuario.supervisor:
        return const SupervisorDashboard();
      case RolUsuario.jefe:
        return const JefeDashboard();
    }
  }
}
