import 'package:flutter/cupertino.dart';

class Livro {
  String? titulo = '';
  String? descricao = '';
  bool? lido = false;

  //Livro(
    //this.titulo,
    //this.descricao,
    //this.lido,
  //);

  @override
  String toString() {
    return 'titulo: $titulo, descricao: $descricao, lido: $lido';
  }
}
