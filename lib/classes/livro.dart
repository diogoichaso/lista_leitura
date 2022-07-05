class Livro {
  String titulo = '';
  String descricao = '';
  bool lido = false;

  Livro(
    this.titulo,
    this.descricao,
    this.lido,
  );
}

final listaDeLivros = [
  Livro('Código Limpo', 'Ótimo livro', false),
  Livro('C completo  total', '', false),
  Livro('Java: Use a cabeça', 'Livro muito bom', true),
];
