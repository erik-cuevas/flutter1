import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Clave global para identificar y validar el formulario
  final _formKey = GlobalKey<FormState>();

  // Controladores para capturar los datos de los campos
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Función que se ejecuta al presionar el botón de "Ingresar"
  void _login() {
    // Verifica si el formulario pasó todas las validaciones
    if (_formKey.currentState!.validate()) {
      // Si es correcto → navegamos a la pantalla de bienvenida
      Navigator.pushNamed(
        context,
        '/welcome',
        arguments: _emailController.text, // Pasamos el correo como argumento
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior de la app
      appBar: AppBar(
        title: const Text('Login IoT'),
        backgroundColor: Colors.red,
      ),
      // Contenido de la pantalla
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Asociamos el formulario a la clave global
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Campo de correo electrónico
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  border: OutlineInputBorder(),
                ),
                // Validación del correo
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su correo';
                  } else if (!value.contains('@')) {
                    return 'Correo inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Campo de contraseña
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
                obscureText: true, // Oculta el texto con puntitos
                // Validación de la contraseña
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su contraseña';
                  } else if (value.length < 6) {
                    return 'Mínimo 6 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Botón de ingresar
              ElevatedButton(
                onPressed: _login, // Ejecuta la función de login
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Ingresar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
