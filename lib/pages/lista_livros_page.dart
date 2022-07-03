import 'package:flutter/material.dart';

class ListaLivrosPage extends StatefulWidget {
  ListaLivrosPage({Key? key}) : super(key: key);

  @override
  State<ListaLivrosPage> createState() => _ListaLivrosPageState();
}

class _ListaLivrosPageState extends State<ListaLivrosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color(0xFFF1EF88),
     body: SafeArea(
       child: Stack(children: [Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Lista de leitura...', style: TextStyle(
                  color: Color(0xFF498C9A),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                ),
                FloatingActionButton(
                  onPressed: (){},
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
       ),],)
     )
    );
  }
}
