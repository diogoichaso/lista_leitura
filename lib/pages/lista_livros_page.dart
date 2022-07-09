import 'package:flutter/material.dart';
import 'package:lista_leitura/classes/livro.dart';
import 'package:lista_leitura/pages/formulario_livro_page.dart';

import '../componentes/componentes.dart';

class ListaLivrosPage extends StatefulWidget {
  final Livro livro;

  ListaLivrosPage(this.livro);

  @override
  State<ListaLivrosPage> createState() => _ListaLivrosPageState();
}

class _ListaLivrosPageState extends State<ListaLivrosPage> {
  List<Livro> meuLivro = [];
  @override
  void initState() {
    print('Entrou no initState. livro: ${widget.livro}');
    if (widget.livro != Null) {
      print('widget.livro != null');
      meuLivro.add(widget.livro);
      print(meuLivro);
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1EF88),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 58),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Lista de leitura...',
                          style: TextStyle(
                            color: Color(0xFF498C9A),
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            // Navigator.of(context).push('/form');//NAVEGAÇÃO POR ROTAS
                            //NAVEGAÇÃO DIRETA
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => FormularioLivroPage(),
                              ),
                            );
                            //setState(() {
                            //lerLivro(context, meuLivro);
                            //});
                          },
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                  LinhaHorizontal(),
                  ListaLivros(meuLivro),
                  if (meuLivro.isNotEmpty) LinhaHorizontal(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 38),
                child: VerticalDivider(
                  color: Colors.red.shade200,
                  thickness: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void lerLivro(context, meuLivro) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => FormularioLivroPage(),
    ),
  );
}
