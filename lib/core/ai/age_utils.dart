import 'dart:math';

class AgeUtils {
  /// Calcula idade cronológica com base na data de nascimento
  static int calcularIdadeCronologica(DateTime nascimento) {
    final hoje = DateTime.now();
    int idade = hoje.year - nascimento.year;

    if (hoje.month < nascimento.month ||
        (hoje.month == nascimento.month && hoje.day < nascimento.day)) {
      idade--;
    }
    return idade;
  }

  /// Simula idade metabólica (±10% da cronológica, com leve aleatoriedade)
  static int estimarIdadeMetabolica(int idadeCronologica) {
    final random = Random();
    final variacao = idadeCronologica * 0.1;
    return (idadeCronologica + random.nextInt(variacao.round() * 2) - variacao).round();
  }

  /// Simula massa magra estimada com base em idade (valores fictícios para MVP)
  static double estimarMassaMagra(int idadeCronologica) {
    final random = Random();
    double base = 55 - ((idadeCronologica - 25) * 0.3);
    return double.parse((base + random.nextDouble() * 2).toStringAsFixed(1));
  }

  /// Score bioemocional com base simbólica (IA sagrada futura substituirá)
  static double gerarScoreBioemocional() {
    final random = Random();
    return double.parse((80 + random.nextDouble() * 20).toStringAsFixed(2)); // entre 80–100
  }

  /// Comentário motivacional baseado na diferença de idade
  static String gerarComentario(int idadeCrono, int idadeMeta) {
    final diff = idadeCrono - idadeMeta;
    if (diff <= 0) return "✨ Você já está no tempo AGELESS. Mantenha o ritmo!";
    if (diff <= 5) return "🚀 Falta pouco para a sua idade ideal. Persevere.";
    if (diff <= 10) return "🔥 Está no caminho. Ajuste hábitos e avance.";
    return "🌱 Hora de um novo ciclo. Vamos reconstruir juntos!";
  }
}
