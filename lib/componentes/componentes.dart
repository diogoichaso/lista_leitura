import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_leitura/pages/formulario_livro_page.dart';

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
  const ListaLivros(this.listaLivros, this.onCadastrar);

  final Set<Livro> listaLivros;
  final Function(Livro) onCadastrar;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, i) {
        final livro = listaLivros.elementAt(i);
        return ListTile(
          onTap: (() => {
              print(livro),
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => FormularioLivroPage(livro, onCadastrar)))
              }),
          title: Padding(
            padding: const EdgeInsets.only(left: 58),
            child: Text(
              livro.titulo,
              style: TextStyle(
                  color: livro.lido ? Colors.grey : Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  decoration: livro.lido ? TextDecoration.lineThrough : null),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(left: 58),
            child: Text(
              livro.descricao,
              style: TextStyle(
                  color: livro.lido ? Colors.grey : Colors.black,
                  decoration: livro.lido ? TextDecoration.lineThrough : null),
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
