// @dart=2.9

class Usuario {
  String idUsuario;
  String nombre;
  String telefono;
  String email;

  Usuario({this.idUsuario, this.nombre, this.telefono, this.email});

  factory Usuario.fromJson(Map<String, dynamic> parsedJson) {
    return Usuario(
        idUsuario: parsedJson['idUsuario'],
        nombre: parsedJson['nombre'],
        telefono: parsedJson['telefono'],
        email: parsedJson['email']);
  }
}
