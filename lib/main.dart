import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lista_leitura/pages/formulario_livro_page.dart';
import 'pages/lista_livros_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        '/':(context) => ListaLivrosPage(),//"Home"
        '/form':(context) => FormularioLivroPage(),
      },
     // home: ListaLivrosPage(), - Usando Navegação por rotas, não precisa do atributo home:
    );
  }
}
