import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ✅ Importe a tela do relatório completo (crie o arquivo se ainda não existir)
import 'full_report_screen.dart';

class ScanResultScreen extends StatelessWidget {
  const ScanResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String nome = "John Doe";
    final String codigo = "ABCD1234";
    final String dataHora = "18/06/2025 18:00";
    final int idadeCronologica = 30;
    final int idadeMetabolica = 45;
    final int targetAgeless = 27;
    final int bioScore = 82;
    final int rankingNacional = 5;

    final int anosParaMeta = idadeMetabolica - targetAgeless;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 12),
              Text(
                "RESULTADO SCANNER AGELESS",
                textAlign: TextAlign.center,
                style: GoogleFonts.orbitron(
                  fontSize: 18,
                  color: Colors.cyanAccent,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.cyanAccent.withOpacity(0.6),
                      blurRadius: 18,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 48,
                  backgroundImage: AssetImage('assets/avatar_placeholder.jpg'),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                nome,
                style: GoogleFonts.orbitron(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Código: $codigo",
                style: GoogleFonts.orbitron(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Data/Hora: $dataHora",
                style: GoogleFonts.orbitron(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Idade Cronológica: $idadeCronologica anos",
                style: GoogleFonts.orbitron(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Idade Metabólica: $idadeMetabolica",
                    style: GoogleFonts.orbitron(
                      fontSize: 16,
                      color: Colors.cyanAccent,
                    ),
                  ),
                  Text(
                    "TARGET AGELESS: $targetAgeless",
                    style: GoogleFonts.orbitron(
                      fontSize: 16,
                      color: Colors.cyanAccent,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: idadeMetabolica > targetAgeless
                    ? ((idadeMetabolica - targetAgeless) / idadeMetabolica).clamp(0.0, 1.0)
                    : 1.0,
                minHeight: 10,
                backgroundColor: Colors.grey[850],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.cyanAccent),
              ),
              const SizedBox(height: 6),
              Text(
                "Faltam ${anosParaMeta.abs()} anos • ${(100 - (anosParaMeta.abs() / idadeMetabolica * 100)).toStringAsFixed(0)}% concluído",
                style: GoogleFonts.orbitron(
                  fontSize: 13,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 28),
              Text(
                "AGELESS BIOSCORE",
                style: GoogleFonts.orbitron(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.amberAccent,
                ),
              ),
              Text(
                "$bioScore",
                style: GoogleFonts.orbitron(
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyanAccent,
                  shadows: [
                    Shadow(
                      color: Colors.cyan.withOpacity(0.7),
                      blurRadius: 20,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Mantenha o foco – você está cada vez mais perto da sua meta!",
                textAlign: TextAlign.center,
                style: GoogleFonts.orbitron(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.military_tech, color: Colors.amber),
                    const SizedBox(width: 8),
                    Text(
                      "Ranking Nacional: $rankingNacionalº",
                      style: GoogleFonts.orbitron(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // ação de reescaneamento
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyanAccent,
                  foregroundColor: Colors.black,
                  elevation: 8,
                  shadowColor: Colors.cyanAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: GoogleFonts.orbitron(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text("REESCANEAR"),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const FullReportScreen(),
                    ),
                  );
                },
                child: Text(
                  "Ver relatório completo",
                  style: GoogleFonts.orbitron(
                    fontSize: 14,
                    color: Colors.white70,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
