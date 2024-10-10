import 'package:flutter/material.dart';

class AnalysisResult extends StatelessWidget {
  final String? summary;
  final String? actions;
  final String? fileName;
  final String? tribunal;

  const AnalysisResult({
    super.key,
    required this.summary,
    required this.actions,
    required this.fileName,
    required this.tribunal,
  });

  @override
  Widget build(BuildContext context) {
    if (summary == null || actions == null) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(color: Colors.deepPurple, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Resumo do Documento:',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            summary!,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          Text(
            'Próximas Ações:',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            actions!,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          Text(
            'Tribunal: $tribunal\nArquivo: $fileName',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
