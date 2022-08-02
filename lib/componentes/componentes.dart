import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_leitura/pages/formulario_livro_page.dart';

import '../classes/livro.dart';
import '../pages/lista_livros_page.dart';

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

class ListaLivros extends StatefulWidget {
  ListaLivros(this.listaLivros, this.onCadastrar, this.onDeletar);

  Set<Livro> listaLivros;
  final Function(Livro) onCadastrar;
  final Function(Livro) onDeletar;

  @override
  State<ListaLivros> createState() => _ListaLivrosState();
}

class _ListaLivrosState extends State<ListaLivros> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, i) {
        final livro = widget.listaLivros.elementAt(i);
        return ListTile(
          onTap: (() => {
                print(livro),
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) =>
                        FormularioLivroPage(livro, widget.onCadastrar)))
              }),
          trailing: GestureDetector(
            onTap: () {
              print(livro);
              setState(() {
                widget.onDeletar(livro);
                ListaLivrosPage();
              });
            },
            child: Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(Icons.delete_forever),
            ),
          ),
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
      itemCount: widget.listaLivros.length,
    );
  }
}
