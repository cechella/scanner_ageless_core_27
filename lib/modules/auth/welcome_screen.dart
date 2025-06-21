import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../home/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 32),
            Text(
              "✨ BEM-VINDO À ERA AGELESS ✨",
              textAlign: TextAlign.center,
              style: GoogleFonts.orbitron(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.cyanAccent,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            Image.asset(
              'assets/ageless_brain_glow.jpg',
              height: 180,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 24),

            /// 🔽 Aqui entra o texto com rolagem
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: const Text(
                  "🎉 Parabéns, você agora faz parte da jornada mais extraordinária da sua existência.\n\n"
                  "Você não está apenas criando uma conta — está acessando um novo tempo.\n\n"
                  "🌌 Bem-vindo à AGELESS.\n\n"
                  "O único lugar do mundo onde sua idade cronológica deixa de ser um limite,\n"
                  "e sua decisão passa a comandar a realidade.\n\n"
                  "🛡️ Você é AGELESS.\n\n"
                  "E nós vamos provar, com ciência e espírito, que o tempo pode ser seu aliado.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// 🔽 Botão fixo no final
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomeScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyanAccent,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: const Text(
                    'ENTRAR NO UNIVERSO AGELESS',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
