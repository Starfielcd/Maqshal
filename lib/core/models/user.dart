enum RolUsuario {
  operario,
  mecanico,
  supervisor,
  jefe
}

extension RolUsuarioExtension on RolUsuario {
  String get nombre {
    switch (this) {
      case RolUsuario.operario:
        return 'Operario';
      case RolUsuario.mecanico:
        return 'Mecánico';
      case RolUsuario.supervisor:
        return 'Supervisor';
      case RolUsuario.jefe:
        return 'Jefe de Operaciones';
    }
  }
}

class Usuario {
  final String id;
  final String nombre;
  final String dni;
  final String contrasena;
  final String correo;
  final RolUsuario rol;
  final bool esValido;

  Usuario({
    required this.id,
    required this.nombre,
    required this.dni,
    required this.contrasena,
    required this.correo,
    required this.rol,
    this.esValido = true,
  });

  factory Usuario.invalido() => Usuario(
        id: '',
        nombre: '',
        dni: '',
        contrasena: '',
        correo: '',
        rol: RolUsuario.operario,
        esValido: false,
      );

  @override
  String toString() {
    return 'Usuario(nombre: $nombre, rol: ${rol.nombre})';
  }
}
