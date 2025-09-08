import 'package:flutter/material.dart';
import 'login_screen/login_screen.dart';
import 'welcome_screen/welcome_screen.dart';

void main() {
  // Punto de entrada de la aplicación
  runApp(const AplicacionIOT());
}

class AplicacionIOT extends StatelessWidget {
  const AplicacionIOT({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicación IoT',
      theme: ThemeData(
        // Definimos el tema principal con color rojo (estilo INACAP)
        primarySwatch: Colors.red,
      ),
      // Ruta inicial: la primera pantalla que se abre será LoginScreen
      initialRoute: '/',
      // Definimos las rutas de la app
      routes: {
        '/': (context) => const LoginScreen(), // Pantalla de Login
        '/welcome': (context) =>
            const WelcomeScreen(), // Pantalla de Bienvenida
      },
    );
  }
}
