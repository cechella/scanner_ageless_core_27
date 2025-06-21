class ScanResult {
  final String uid;
  final int idadeCronologica;
  final int idadeMetabolica;
  final double massaMagraEstimativa;
  final double scoreBioemocional;
  final int diferencaIdadeTarget;
  final String comentarioMotivacional;
  final DateTime timestamp;
  final String versaoModelo;

  ScanResult({
    required this.uid,
    required this.idadeCronologica,
    required this.idadeMetabolica,
    required this.massaMagraEstimativa,
    required this.scoreBioemocional,
    required this.diferencaIdadeTarget,
    required this.comentarioMotivacional,
    required this.timestamp,
    required this.versaoModelo,
  });

  factory ScanResult.fromMap(Map<String, dynamic> map) {
    return ScanResult(
      uid: map['uid'] ?? '',
      idadeCronologica: map['idade_cronologica'] ?? 0,
      idadeMetabolica: map['idade_metabolica'] ?? 0,
      massaMagraEstimativa: (map['massa_magra_estimativa'] ?? 0).toDouble(),
      scoreBioemocional: (map['score_bioemocional'] ?? 0).toDouble(),
      diferencaIdadeTarget: map['diferenca_idade_target'] ?? 0,
      comentarioMotivacional: map['comentario_motivacional'] ?? '',
      timestamp: DateTime.parse(map['timestamp']),
      versaoModelo: map['versao_modelo'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'idade_cronologica': idadeCronologica,
      'idade_metabolica': idadeMetabolica,
      'massa_magra_estimativa': massaMagraEstimativa,
      'score_bioemocional': scoreBioemocional,
      'diferenca_idade_target': diferencaIdadeTarget,
      'comentario_motivacional': comentarioMotivacional,
      'timestamp': timestamp.toIso8601String(),
      'versao_modelo': versaoModelo,
    };
  }
}
