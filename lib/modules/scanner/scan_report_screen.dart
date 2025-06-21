import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScanReportScreen extends StatelessWidget {
  const ScanReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "RELATÓRIO COMPLETO",
          style: GoogleFonts.orbitron(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 1,
          ),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.cyanAccent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle("📌 IDADE BIOLÓGICA E METABÓLICA"),
            line("Idade Cronológica:", "42 anos"),
            line("Idade Metabólica:", "34 anos"),
            line("Gap atual:", "7 anos"),
            line("Target AGELESS:", "27 anos"),

            const SizedBox(height: 28),
            sectionTitle("📊 COMPOSIÇÃO CORPORAL"),
            line("Peso estimado:", "83,5 kg"),
            line("Massa magra:", "58,2 kg"),
            line("Massa gorda:", "25,3 kg"),
            line("Gordura visceral:", "Moderada"),
            line("IMC / % gordura:", "26,1 / 22,8%"),

            const SizedBox(height: 28),
            sectionTitle("🔥 PERFIL HORMONAL E METABÓLICO"),
            line("Testosterona total:", "489 ng/dL"),
            line("Cortisol (sintomas):", "Alto"),
            line("Vitamina D:", "21 ng/mL"),
            line("Melatonina regenerativa:", "Baixa"),

            const SizedBox(height: 28),
            sectionTitle("🌟 BIOSCORE AGELESS"),
            line("Bioscore final:", "74 / 100"),
            line("Ranking Nacional:", "Top 5%"),
            line("Ranking por idade:", "Top 12%"),
            line("Ranking regional:", "Top 3%"),

            const SizedBox(height: 28),
            sectionTitle("🧠 MENSAGEM DO 7º HOMEM"),
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 12),
              child: Text(
                "“Seu corpo já despertou. Agora é sua mente que precisa obedecer à sua promessa.”",
                style: GoogleFonts.orbitron(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.white70,
                  height: 1.6,
                ),
              ),
            ),

            sectionTitle("🛡 AÇÕES RECOMENDADAS"),
            bullet("Treino: 45min de musculação + 20min cardio (5x/sem)"),
            bullet("Jejum intermitente: 16h jejum / 8h alimentação"),
            bullet("Ciclo metabólico: reprogramação de 3 semanas"),
            bullet("Suplementação: Vitamina D3 + Tribulus + Ashwagandha"),

            const SizedBox(height: 48),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyanAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadowColor: Colors.cyan,
                  elevation: 6,
                ),
                child: Text(
                  "VOLTAR",
                  style: GoogleFonts.orbitron(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: GoogleFonts.orbitron(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.cyanAccent,
        ),
      ),
    );
  }

  Widget line(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(label,
                style: GoogleFonts.orbitron(
                    color: Colors.white70, fontSize: 14)),
          ),
          const SizedBox(width: 12),
          Text(value,
              style: GoogleFonts.orbitron(
                  color: Colors.cyanAccent,
                  fontWeight: FontWeight.w500,
                  fontSize: 14)),
        ],
      ),
    );
  }

  Widget bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(color: Colors.cyanAccent)),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.orbitron(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}
