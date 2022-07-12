import 'package:flutter/cupertino.dart';

class Livro {
  int id;
  String titulo = '';
  String descricao = '';
  bool lido = false;

  Livro(
    this.id,
    this.titulo,
    this.descricao,
    this.lido,
  );
  bool operator ==(o) => o is Livro && id == o.id;
  int get hashCode => id;
  
  @override
  String toString() {
    return 'titulo: $titulo, descricao: $descricao, lido: $lido';
  }
}
