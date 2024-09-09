import 'package:flutter/foundation.dart';

void main() {
  // Vetor que armazena o faturamento diário de todos os dias do ano (exemplo fictício)
  List<double> faturamentoDiario = [
    0, 220.5, 530.2, 0, 720.6, 320.4,
    0, // Semana com alguns dias sem faturamento
    0, 215.0, 450.3, 0, 0, 610.0, 0, // Outra semana
    // Continue com o restante dos dias do ano...
  ];

  // Filtrar os dias com faturamento diferente de 0
  List<double> faturamentoValido =
      faturamentoDiario.where((valor) => valor > 0).toList();

  // Se não houver faturamento, não há o que calcular
  if (faturamentoValido.isEmpty) {
    if (kDebugMode) {
      print("Não houve faturamento no ano.");
    }
    return;
  }

  // Menor e maior valor de faturamento
  double menorFaturamento = faturamentoValido.reduce((a, b) => a < b ? a : b);
  double maiorFaturamento = faturamentoValido.reduce((a, b) => a > b ? a : b);

  // Média de faturamento anual (dias sem faturamento são ignorados)
  double mediaFaturamento =
      faturamentoValido.reduce((a, b) => a + b) / faturamentoValido.length;

  // Número de dias com faturamento acima da média
  int diasAcimaDaMedia =
      faturamentoValido.where((valor) => valor > mediaFaturamento).length;
  if (kDebugMode) {
    // Exibir os resultados
    print("Menor valor de faturamento: $menorFaturamento");
    print("Maior valor de faturamento: $maiorFaturamento");
    print("Número de dias com faturamento superior à média: $diasAcimaDaMedia");
  }
}
