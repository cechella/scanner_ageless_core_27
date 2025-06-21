import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FullReportScreen extends StatelessWidget {
  const FullReportScreen({super.key});

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
            color: Colors.cyanAccent,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.cyanAccent),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            section("📌 IDADE BIOLÓGICA E METABÓLICA", [
              item("Idade Cronológica", "42 anos"),
              item("Idade Metabólica", "34 anos"),
              item("Gap atual", "7 anos"),
              item("Target AGELESS", "27 anos"),
            ]),
            section("📊 COMPOSIÇÃO CORPORAL", [
              item("Peso estimado", "83,5 kg"),
              item("Massa magra", "58,2 kg"),
              item("Massa gorda", "25,3 kg"),
              item("Gordura visceral", "Moderada"),
              item("IMC / % gordura", "26,1 / 22,8%"),
            ]),
            section("🔥 PERFIL HORMONAL E METABÓLICO", [
              item("Testosterona total", "489 ng/dL"),
              item("Cortisol (sintomas)", "Alto"),
              item("Vitamina D", "21 ng/mL"),
              item("Melatonina regenerativa", "Baixa"),
            ]),
            section("🌟 BIOSCORE AGELESS", [
              item("Bioscore final", "74 / 100"),
              item("Ranking Nacional", "Top 5%"),
              item("Ranking por idade", "Top 12%"),
              item("Ranking regional", "Top 3%"),
            ]),
            section("🧠 MENSAGEM DO 7º HOMEM", [
              Text(
                "“Seu corpo já despertou. Agora é sua mente que precisa obedecer à sua promessa.”",
                style: GoogleFonts.orbitron(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.white70,
                  height: 1.5,
                ),
              ),
            ]),
            section("🛡 AÇÕES RECOMENDADAS", [
              bullet("Treino: 45min de musculação + 20min cardio (5x/sem)"),
              bullet("Jejum intermitente: 16h jejum / 8h alimentação"),
              bullet("Ciclo metabólico: reprogramação de 3 semanas"),
              bullet("Suplementação: Vitamina D3 + Tribulus + Ashwagandha"),
            ]),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyanAccent,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  textStyle: GoogleFonts.orbitron(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    letterSpacing: 1,
                  ),
                ),
                child: const Text("VOLTAR"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget section(String title, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.orbitron(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.cyanAccent,
            ),
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  Widget item(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 14)),
          Text(value, style: const TextStyle(color: Colors.cyanAccent, fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget bullet(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(color: Colors.cyanAccent)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
