import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scanner_ageless_core_27/shared/models/user_model.dart';
import 'package:scanner_ageless_core_27/shared/services/user_service.dart';
import 'welcome_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();

  DateTime? selectedDate;
  bool _loading = false;

  Future<void> _register() async {
    if (!_formKey.currentState!.validate() || selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preencha todos os campos obrigatórios.")),
      );
      return;
    }

    setState(() => _loading = true);

    try {
      final auth = FirebaseAuth.instance;
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      final uid = userCredential.user!.uid;

      final newUser = UserModel(
        uid: uid,
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        instagram: instagramController.text.trim(),
        birthDate: selectedDate!,
        createdAt: DateTime.now(),
      );

      await UserService().saveUserData(newUser);

      print("✅ Cadastro e salvamento no Firestore bem-sucedidos");

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const WelcomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      print("❌ FirebaseAuthException: ${e.code} - ${e.message}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro de autenticação: ${e.message}")),
      );
    } on FirebaseException catch (e) {
      print("❌ FirebaseException: ${e.code} - ${e.message}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro ao salvar dados: ${e.message}")),
      );
    } catch (e) {
      print("❌ Erro geral: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Erro inesperado. Tente novamente.")),
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Criar Conta", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildTextField("Nome completo", nameController),
              buildTextField("Email", emailController),
              buildTextField("Senha", passwordController, isPassword: true),
              buildTextField("Telefone", phoneController),
              buildTextField("Instagram", instagramController),
              const SizedBox(height: 16),
              ListTile(
                title: Text(
                  selectedDate == null
                      ? 'Data de Nascimento'
                      : 'Nascimento: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                  style: const TextStyle(color: Colors.white70),
                ),
                trailing: const Icon(Icons.calendar_month, color: Colors.white),
                onTap: () async {
                  final now = DateTime.now();
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime(now.year - 18),
                    firstDate: DateTime(1900),
                    lastDate: now,
                  );
                  if (picked != null) {
                    setState(() => selectedDate = picked);
                  }
                },
              ),
              const SizedBox(height: 32),
              _loading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: _register,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyanAccent,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      child: const Text("CRIAR CONTA", style: TextStyle(color: Colors.black)),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white54),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white24),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.cyanAccent),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Campo obrigatório';
          }
          return null;
        },
      ),
    );
  }
}
