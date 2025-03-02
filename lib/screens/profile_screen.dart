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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const ProfileAvatar(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ProfileInfo(),
              ),
              const SizedBox(height: 20),
            ],
          ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ProfileText(title: "Nome:", value: "Carlos Felipe Araújo"),
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.black38),
                onPressed: () {
                  // Implementar lógica de edição do nome
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          const ProfileText(title: "E-mail:", value: "carlosxfelipe@gmail.com"),
          const SizedBox(height: 10),
          const ProfileText(title: "Telefone:", value: "(85) 99950-2195"),
          const SizedBox(height: 10),
          const ProfileText(title: "Localização:", value: "Fortaleza, CE"),
          const SizedBox(height: 10),
          const ProfileText(title: "Data de Nascimento:", value: "03/10/1987"),
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
                // Implementar lógica de logout
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sair da Conta",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.logout, size: 20, color: Colors.white),
                ],
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
