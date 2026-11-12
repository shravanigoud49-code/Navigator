import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animations',
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        useMaterial3: true,
      ),
      home: const AnimationTypesScreen(),
    );
  }
}

class AnimationTypesScreen extends StatefulWidget {
  const AnimationTypesScreen({super.key});

  @override
  State<AnimationTypesScreen> createState() =>
      _AnimationTypesScreenState();
}

class _AnimationTypesScreenState
    extends State<AnimationTypesScreen> {
  bool isFaded = false;
  bool isSlid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            const Text(
              ' Animations',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),

            // Fade Animation
            AnimatedOpacity(
              duration: const Duration(milliseconds: 800),
              opacity: isFaded ? 0.2 : 1.0,
              child: const Icon(
                Icons.lightbulb,
                size: 75,
                color: Colors.black,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isFaded = !isFaded;
                });
              },
              child: const Text('Fade Animation'),
            ),

            const SizedBox(height: 20),

            // Slide Animation
            AnimatedSlide(
              duration: const Duration(milliseconds: 600),
              offset: isSlid
                  ? const Offset(0.8, 0)
                  : Offset.zero,
              child: const Icon(
                Icons.directions_run,
                size: 65,
                color: Colors.blue,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isSlid = !isSlid;
                });
              },
              child: const Text('Slide Animation'),
            ),

            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}