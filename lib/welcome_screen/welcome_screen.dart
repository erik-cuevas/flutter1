import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtenemos el correo pasado como argumento desde LoginScreen
    final String email =
        ModalRoute.of(context)!.settings.arguments as String? ?? 'usuario';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenida'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        // Mostramos el mensaje personalizado con el correo
        child: Text(
          'Bienvenido $email',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
