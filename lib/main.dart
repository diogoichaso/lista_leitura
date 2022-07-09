import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lista_leitura/classes/livro.dart';
import 'package:lista_leitura/pages/formulario_livro_page.dart';
import 'pages/lista_livros_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Livro livro = Livro();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.kalamTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      routes: {
        //'/':(context) => ListaLivrosPage(),//"Home"
        //'/form':(context) => FormularioLivroPage(),
      },
      home: ListaLivrosPage(
          livro), //- Usando Navegação por rotas, não precisa do atributo home:
    );
  }
}
