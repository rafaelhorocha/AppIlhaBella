class Praia {
  late String nome;
  late String descricao;
  late String imagem;

  Praia(this.nome, this.descricao, this.imagem);

  void atualizarNome(String n) {
    nome = n;
  }

  void atualizarDescricao(String d) {
    descricao = d;
  }
}

List<Praia> getPraias() {
  return [
    Praia(
        'História de IlhaBela',
        'Ilhabela é um verdadeiro paraíso tropical localizado no litoral norte de São Paulo, Brasil. Conhecida por suas belezas naturais deslumbrantes, a ilha é famosa por suas praias de areia branca, águas cristalinas e exuberante vegetação. Com uma rica biodiversidade, Ilhabela abriga diversas espécies de flora e fauna, sendo um destino popular para amantes da natureza e ecoturismo.',
        'assets/img/ilha.jpg'),
    Praia(
        'Praia do Perequê',
        'A Praia do Perequê é uma das mais conhecidas e frequentadas de Ilhabela, oferecendo um cenário deslumbrante que combina belezas naturais e infraestrutura. Com suas areias brancas e finas, a praia é cercada por uma vegetação exuberante e colinas que proporcionam uma vista espetacular do oceano.',
        'assets/img/pereque.jpg'),
    Praia(
        'Praia da Feiticeira',
        'A Praia da Feiticeira é um verdadeiro paraíso escondido em Ilhabela, cercada por uma natureza exuberante e montanhas verdejantes. Com suas águas cristalinas e tranquilas, a praia é perfeita para um mergulho refrescante ou para relaxar sob o sol em suas areias finas e douradas. A Feiticeira é famosa por sua beleza natural e tranquilidade, tornando-se um refúgio ideal para quem busca paz e contato com a natureza. O som suave das ondas e o canto dos pássaros criam um ambiente relaxante, perfeito para meditação ou uma leitura à sombra de uma árvore.',
        'assets/img/feiticeira.png'),
  ];
}
