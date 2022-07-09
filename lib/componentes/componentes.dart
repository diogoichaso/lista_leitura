import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../classes/livro.dart';

class LinhaHorizontal extends StatelessWidget {
  const LinhaHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Color(0xFFD8DB74),
      thickness: 2,
    );
  }
}

class ListaLivros extends StatelessWidget {
  const ListaLivros(this.listaLivros);

  final List<Livro> listaLivros;

  String lerTitulo(livro) {
    if (livro.titulo == null) {
      return '';
    } else {
      return livro.titulo;
    }
  }

  bool confereLido(livro) {
    if (livro.lido == null) {
      return false;
    } else {
      return livro.lido;
    }
  }

  String lerDescricao(livro) {
    if (livro.descricao == null) {
      return '';
    } else {
      return livro.descricao;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, i) {
        final livro = listaLivros[i];
        return ListTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 58),
            child: Text(
              lerTitulo(livro),
              style: TextStyle(
                  color: confereLido(livro) ? Colors.grey : Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  decoration:
                      confereLido(livro) ? TextDecoration.lineThrough : null),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(left: 58),
            child: Text(
              lerDescricao(livro),
              style: TextStyle(
                  color: confereLido(livro) ? Colors.grey : Colors.black,
                  decoration:
                      confereLido(livro) ? TextDecoration.lineThrough : null),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          visualDensity: VisualDensity.compact,
          contentPadding: EdgeInsets.all(0),
        );
      },
      separatorBuilder: (context, i) => LinhaHorizontal(),
      itemCount: listaLivros.length,
    );
  }
}
