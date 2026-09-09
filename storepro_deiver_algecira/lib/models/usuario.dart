class Usuario {
  final int id;
  final int nombre; // O String según prefieras, mantengámoslo estándar como String:
  final String email;

  Usuario({required this.id, required this.nombre, required this.email});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      nombre: json['nombre'],
      email: json['email'],
    );
  }
}