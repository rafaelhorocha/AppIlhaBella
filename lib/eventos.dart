class Evento {
  late String nome;
  late String imagem;
  late String descricao;
  late String data;
  late String hora;
  late String local;
  late String links;

  Evento(this.nome, this.imagem, this.descricao, this.data, this.hora,
      this.local, this.links);

  void atualizarNome(String newNome) {
    nome = newNome;
  }

  void atualizarImagem(String newImg) {
    nome = newImg;
  }

  void atualizarDescricao(String newDesc) {
    descricao = newDesc;
  }

  void atualizarData(String newData) {
    links = newData;
  }

  void atualizarHora(String newHora) {
    links = newHora;
  }

  void atualizarLocal(String newLocal) {
    links = newLocal;
  }

  void atualizarLinks(String newLink) {
    links = newLink;
  }
}

final List<Evento> eventos = [
  Evento(
      'COPA MITSUBISHI',
      'assets/img/copa2.jpg',
      'O evento acontece em Ilhabela, uma ilha no litoral norte de São Paulo, conhecida por suas águas calmas, ventos sofisticados e paisagens deslumbrantes. Durante a Copa Mitsubishi, a cidade se transforma em um ponto de encontro para os apaixonados por vela, com regatas disputadas em diversas categorias de barcos, como monotipos e veleiros de oceano.',
      '15, 16, 22, 23 de junho',
      '15 e 22 às 08:00; 16 e 23 às 14:00;',
      ' Yacht Club de Ilhabela, Av. Força Expedicionária Brasileira, 399 - Santa Tereza',
      'https://circuitoilhabela.com.br'),
  Evento(
      'FERRUGEM SUNSET',
      'assets/img/evento1.jpg',
      'O Ferrugem Sunset é um evento icônico em Ilhabela, que acontece principalmente na Praia do Curral. Com uma proposta de reunir música, gastronomia e a beleza natural do pôr do sol, o evento atrai tanto moradores quanto turistas.',
      '16 de novembro',
      '16h ás 22h',
      ' Sea Club Ilhabela, Av. Pedro de Paula Moraes, 616 - Saco da Capela - Ilhabela - SP',
      'https://www.ticket360.com.br/evento/29549/ingressos-para-ferrugem-sunset?srsltid=AfmBOoo9jWxVYPFsIbtyUOQVKSeUuUgsd1XB-iVlr5Bgbv5uvdlcrnh0'),
  Evento(
      'FESTIVAL DO CAMARÃO',
      'assets/img/camarao.jpg',
      'O Festival do Camarão de Ilhabela é um evento gastronômico que acontece anualmente, geralmente em julho, celebrando a rica culinária da região. Durante o festival, diversos restaurantes e chefs locais se reúnem para apresentar pratos variados à base de camarão, oferecendo uma experiência gastronômica diversificada e saborosa.',
      '8 de agosto a 8 de setembro',
      'a partir das 19h',
      ' Praça do Papai Noel, Avenida Princesa Isabel, s/n, Centro, Ilhabela - SP',
      'https://www.ilhabela.com.br/events/festival-do-camarao-de-ilhabela-2024/'),
];
