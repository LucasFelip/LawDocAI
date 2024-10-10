import 'package:flutter/material.dart';

class AnalysisButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onPressed;

  const AnalysisButton({
    Key? key,
    required this.isEnabled,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        child: const Text('Gerar Análise'),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          textStyle: const TextStyle(fontSize: 18),
          backgroundColor: isEnabled ? Colors.deepPurpleAccent : Colors.grey,
          side: isEnabled
              ? const BorderSide(color: Colors.deepPurple, width: 2)
              : null,
          foregroundColor: isEnabled ? Colors.white : Colors.black,
          shadowColor: isEnabled ? Colors.deepPurpleAccent : null,
          elevation: isEnabled ? 5 : 0,
        ),
      ),
    );
  }
}
