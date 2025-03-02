import 'package:flutter/material.dart';
import 'package:idrink/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ConvexBottomBar(
      currentIndex: 4,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFE52D27), Color(0xFFB31217)],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
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
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 4),
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(0, 0, 0, 0.2),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: const CircleAvatar(
          radius: 60,
          // backgroundImage: AssetImage('assets/profile-placeholder.png'),
        ),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ProfileText(title: "Nome:", value: "Carlos Felipe Araújo"),
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.blue),
                onPressed: () {
                  // Implementar lógica de edição do nome
                },
              ),
            ],
          ),
          const Divider(thickness: 1, color: Colors.grey),
          const ProfileText(title: "E-mail:", value: "carlosxfelipe@gmail.com"),
          const Divider(thickness: 1, color: Colors.grey),
          const ProfileText(title: "Telefone:", value: "(85) 99950-2195"),
          const Divider(thickness: 1, color: Colors.grey),
          const ProfileText(title: "Localização:", value: "Fortaleza, CE"),
          const Divider(thickness: 1, color: Colors.grey),
          const ProfileText(title: "Data de Nascimento:", value: "03/10/1987"),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.grey),
            title: const Text("Configurações"),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.grey,
            ),
            onTap: () {
              // Implementar lógica de configurações
            },
          ),

          ListTile(
            leading: const Icon(Icons.nightlight_round, color: Colors.grey),
            title: const Text("Modo Escuro"),
            trailing: Switch(
              value: false,
              onChanged: (value) {
                // Implementar lógica de modo escuro
              },
            ),
          ),

          ListTile(
            leading: const Icon(Icons.share, color: Colors.grey),
            title: const Text("Compartilhar App"),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.grey,
            ),
            onTap: () {
              // Implementar lógica de compartilhamento
            },
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade800,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
                elevation: 3,
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
                  const Icon(Icons.logout, size: 22, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileText extends StatelessWidget {
  final String title;
  final String value;

  const ProfileText({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
