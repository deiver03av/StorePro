import 'package:flutter/material.dart';

class NuevoProductoScreen extends StatefulWidget {
  const NuevoProductoScreen({super.key});

  @override
  State<NuevoProductoScreen> createState() => _NuevoProductoScreenState();
}

class _NuevoProductoScreenState extends State<NuevoProductoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreCtrl = TextEditingController();
  final _emailCtrl = TextEditingController(); // Controlador para el correo requerido

  void _guardar() {
    if (_formKey.currentState!.validate()) {
      // Formulario válido: Procesar o enviar datos
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Guardando información...')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Uso de la GlobalKey requerida en el paso 4
          child: Column(
            children: [
              TextFormField(
                controller: _nombreCtrl,
                decoration: const InputDecoration(labelText: 'Nombre *'),
                validator: (val) {
                  if (val == null || val.isEmpty) return 'El nombre es obligatorio';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Correo Electrónico *'),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Por favor ingresa un correo';
                  }
                  // Validador regex requerido para verificar formato '@' y '.'
                  bool emailValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(val);
                  if (!emailValid) {
                    return 'El formato del correo no es válido (debe incluir @ y .)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _guardar,
                child: const Text('GUARDAR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}