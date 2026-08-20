import 'package:flutter/material.dart';

void main() {
  runApp(const UrapMirApp());
}

class UrapMirApp extends StatelessWidget {
  const UrapMirApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'URAPMIR',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('URAPMIR'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.medical_services,
              size: 80,
            ),
            const SizedBox(height: 20),
            const Text(
              'URAPMIR',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'MIR · Atención Primaria · Urgencias',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            FilledButton(
              onPressed: null,
              child: Text('Examen MIR'),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: null,
              child: Text('Atención Primaria'),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: null,
              child: Text('Urgencias Médicas'),
            ),
          ],
        ),
      ),
    );
  }
}
