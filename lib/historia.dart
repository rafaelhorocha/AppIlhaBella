// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names

class historia {
  late String historiaum;
  late String historiaNome;
  late String evolucao;

  historia(this.historiaum, this.historiaNome, this.evolucao);

  void atualizarProgramacao(String historianew) {
    historiaum = historianew;
  }

  void atualizarReal(String historiaNomenew) {
    historiaNome = historiaNomenew;
  }

  void atualizarValores(String evolucaonew) {
    evolucao = evolucaonew;
  }
}
