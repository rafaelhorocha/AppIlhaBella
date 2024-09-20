// ignore_for_file: file_names

class ComoChegar {
  late String carro;
  late String jipe;
  late String barco;

  ComoChegar(this.carro, this.jipe, this.barco);

  // Method to update the carro attribute
  void updateCarro(String novoCarro) {
    carro = novoCarro;
  }

  // Method to update the jipe attribute
  void updateJipe(String novoJipe) {
    jipe = novoJipe;
  }

  // Method to update the barco attribute
  void updateBarco(String novoBarco) {
    barco = novoBarco;
  }
}

List<ComoChegar> chegar = [
  ComoChegar(
    'Informações gerais sobre como chegar à IlhaBela.',
    'Você pode chegar pela balsa a partir de São Sebastião.',
    'assets/img/ilha.jpg',
  ),
  ComoChegar(
    'Informações sobre a Praia do Perequê.',
    'Ideal para quem busca contato com a natureza.',
    'assets/img/pereque.jpg',
  ),
  ComoChegar(
    'Informações sobre a Praia da Feiticeira.',
    'Acessível de carro e trilhas.',
    'assets/img/feiticeira.png',
  ),
];
