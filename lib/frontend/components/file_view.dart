import 'package:flutter/material.dart';

class FileView extends StatelessWidget {
  final String fileName;

  const FileView({super.key, required this.fileName});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurple[50],
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: const Icon(Icons.description, size: 40, color: Colors.deepPurple),
        title: Text(
          fileName,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        subtitle: const Text('Arquivo anexado com sucesso'),
      ),
    );
  }
}
