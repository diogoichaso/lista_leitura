import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lista_leitura/classes/livro.dart';

class FormularioLivroPage extends StatefulWidget {
  FormularioLivroPage({Key? key}) : super(key: key);

  @override
  State<FormularioLivroPage> createState() => _FormularioLivroPageState();
}

class _FormularioLivroPageState extends State<FormularioLivroPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Livro livro = Livro('', '', false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1EF88),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 80),
                child: Text(
                  'Inclua seu novo livro',
                  style: TextStyle(
                    color: Color(0xFF498C9A),
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22),
                child: TextFormField(
                  initialValue: livro.titulo,
                  decoration: InputDecoration(
                    hintText: 'Título',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onSaved: (titulo) {
                    livro.titulo = titulo.toString();
                    print(titulo);
                  },
                  validator: (titulo) =>
                      titulo == '' ? 'Título é obrigatório' : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22),
                child: TextFormField(
                  initialValue: livro.descricao,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Descrição',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onSaved: (descricao) =>
                      livro.descricao = descricao.toString(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(28),
                child: Row(
                  children: [
                    Text('Já li este livro'),
                    Checkbox(
                      activeColor: Colors.grey,
                      value: livro.lido,
                      onChanged: (valor) {
                        setState(
                          () {
                            valor is bool ? livro.lido = valor : null;
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  final form = _formKey.currentState;
                  if (form != null) {
                    form.validate();
                    form.save();
                    print(livro);
                    ;
                  }
                },
                child: Text(
                  'Cadastrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFFE67F22),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
