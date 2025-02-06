import 'package:flutter/material.dart';

class PauseResumeExample extends StatefulWidget {
  const PauseResumeExample({super.key});

  @override
  _PauseResumeExampleState createState() => _PauseResumeExampleState();
}

class _PauseResumeExampleState extends State<PauseResumeExample> {
  bool isPaused = true; // Default state is paused.

  void togglePause() {
    setState(() {
      isPaused = !isPaused; // Toggle between paused and running.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pause & Resume Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isPaused ? 'Paused' : 'Running',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: togglePause,
              style: ElevatedButton.styleFrom(
                backgroundColor: isPaused ? Colors.green : Colors.red,
              ),
              child: Text(
                isPaused ? 'Start' : 'Pause',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
