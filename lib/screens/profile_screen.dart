import 'package:flutter/material.dart';
import 'package:idrink/theme/theme_provider.dart';
import 'package:idrink/widgets.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ConvexBottomBar(
      currentIndex: 3,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const ProfileAvatar(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ProfileInfo(),
              ),
              const SizedBox(height: 60),
            ],
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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color:
                isDarkMode
                    ? Colors.white70
                    : Theme.of(context).scaffoldBackgroundColor,
            width: 4,
          ),
          boxShadow: [
            BoxShadow(
              color:
                  isDarkMode
                      ? const Color.fromRGBO(255, 255, 255, 0.5)
                      : const Color.fromRGBO(0, 0, 0, 0.2),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: const CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(
            "https://avatars.githubusercontent.com/u/85801709?s=400&u=01cce0318ea853ce1a133699bc6b2af1919094d6&v=4",
          ),
        ),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ProfileText(title: "Nome:", value: "Carlos Felipe Araújo"),
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: isDarkMode ? Colors.white : Colors.black38,
                ),
                onPressed: () {
                  // Implementar lógica de edição do nome
                },
              ),
            ],
          ),
          Divider(thickness: 1, color: Theme.of(context).dividerColor),
          const ProfileText(title: "E-mail:", value: "carlosxfelipe@gmail.com"),
          Divider(thickness: 1, color: Theme.of(context).dividerColor),
          const ProfileText(title: "Telefone:", value: "(85) 99950-2195"),
          Divider(thickness: 1, color: Theme.of(context).dividerColor),
          const ProfileText(title: "Localização:", value: "Fortaleza, CE"),
          Divider(thickness: 1, color: Theme.of(context).dividerColor),
          const ProfileText(title: "Data de Nascimento:", value: "03/10/1987"),
          const SizedBox(height: 20),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).iconTheme.color,
            ),
            title: const Text("Configurações"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Theme.of(context).iconTheme.color,
            ),
            onTap: () {
              // Implementar lógica de configurações
            },
          ),
          ListTile(
            leading: Icon(
              Icons.nightlight_round,
              color: Theme.of(context).iconTheme.color,
            ),
            title: const Text("Modo Escuro"),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme(value);
              },
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.share,
              color: Theme.of(context).iconTheme.color,
            ),
            title: const Text("Compartilhar App"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Theme.of(context).iconTheme.color,
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
