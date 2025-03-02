import 'package:flutter/material.dart';
import 'package:idrink/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ConvexBottomBar(
      currentIndex: 4,
      child: Scaffold(
        appBar: const CustomAppBar(showBackButton: true),
        body: const Column(
          children: [
            SizedBox(height: 20),
            ProfileAvatar(),
            SizedBox(height: 20),
            ProfileInfo(),
          ],
        ),
      ),
    );
  }
}

/// Widget do Avatar do Usuário
class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircleAvatar(
        radius: 50,
        // backgroundImage: AssetImage('assets/profile-placeholder.png'),
      ),
    );
  }
}

/// Widget das Informações do Usuário
class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileText(title: "Nome:", value: "Carlos Felipe Araújo"),
          const SizedBox(height: 10),
          const ProfileText(title: "E-mail:", value: "carlosxfelipe@gmail.com"),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () {
                // Implementar logout ou edição do perfil
              },
              child: const Text(
                "Editar Perfil",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget para Exibir Texto de Informações do Perfil
class ProfileText extends StatelessWidget {
  final String title;
  final String value;

  const ProfileText({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(value, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
