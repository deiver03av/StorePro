import 'dart:convert';

class UserService {
  final String _jsonSimulado = '''
    [
      {"id": 1, "nombre": "Ana Pérez", "email": "ana.perez@example.com"},
      {"id": 2, "nombre": "Carlos Gómez", "email": "carlos.gomez@example.com"}
    ]
  ''';

  Future<List<dynamic>> fetchUsuarios() async {
    await Future.delayed(Duration(seconds: 2));
    List<dynamic> listaDecodificada = jsonDecode(_jsonSimulado);
    return listaDecodificada;
  }
}