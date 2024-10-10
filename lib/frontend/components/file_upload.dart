import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';

class FileUpload extends StatelessWidget {
  final Function(Uint8List, String) onFilePicked;

  const FileUpload({super.key, required this.onFilePicked});

  Future<void> _pickFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx', 'doc', 'txt'],
    );

    if (result != null) {
      if (result.files.first.bytes != null) {
        Uint8List fileBytes = result.files.first.bytes!;
        String fileName = result.files.first.name;
        onFilePicked(fileBytes, fileName);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Anexar Documento:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: () => _pickFile(context),
          icon: const Icon(Icons.upload_file),
          label: const Text('Anexar Documento'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            textStyle: const TextStyle(fontSize: 18),
            backgroundColor: Colors.white,
            side: const BorderSide(color: Colors.deepPurple, width: 2),
            foregroundColor: Colors.black,
            shadowColor: Colors.deepPurpleAccent,
            elevation: 5,
          ),
        ),
      ],
    );
  }
}
