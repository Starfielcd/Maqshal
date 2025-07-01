enum EstadoMaquina {
  disponible,
  ocupada,
  mantenimiento,
}

class Maquinaria {
  final String id;
  final String nombre;
  final String tipo;
  final EstadoMaquina estado;

  const Maquinaria({
    required this.id,
    required this.nombre,
    required this.tipo,
    required this.estado,
  });
}
