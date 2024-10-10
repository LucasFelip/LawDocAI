import 'package:flutter/material.dart';
import 'package:law_doc_ai/services/openai_service.dart'; // Importe o serviço OpenAI
import '../components/tribunal_selector.dart';
import '../components/file_upload.dart';
import '../components/analysis_button.dart';
import '../components/analysis_result.dart';
import '../components/footer.dart';
import '../components/file_view.dart';
import 'dart:typed_data';

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({super.key});

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  String? selectedTribunal;
  Uint8List? selectedFileBytes;
  String? fileName;
  String? generatedSummary;
  String? recommendedActions;

  final OpenAIService openAIService = OpenAIService(); // Inicialize o serviço OpenAI

  List<String> tribunais = ['TRT-16', 'TJMA'];

  Future<void> _pickFile(Uint8List fileBytes, String fileName) {
    setState(() {
      selectedFileBytes = fileBytes;
      this.fileName = fileName;
    });
    return Future.value();
  }

  Future<void> _generateSummary() async {
    if (fileName == null || selectedTribunal == null || selectedFileBytes == null) {
      return;
    }

    setState(() {
      generatedSummary = "Gerando resumo...";
      recommendedActions = "Gerando ações recomendadas...";
    });

    try {
      // Converter o conteúdo do arquivo para string
      String fileContent = String.fromCharCodes(selectedFileBytes!);

      // Gerar a análise via OpenAI
      final result = await openAIService.generateAnalysis(fileContent, selectedTribunal!);

      print('Resposta da OpenAI: $result');

    } catch (error) {
      print('Erro: $error');
      setState(() {
        generatedSummary = "Erro ao gerar o resumo.";
        recommendedActions = "Erro ao gerar as próximas ações.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isReadyForAnalysis = selectedTribunal != null && fileName != null;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('LawDocAI - Sistema de Análise Jurídica'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(24.0),
                constraints: const BoxConstraints(maxWidth: 800),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TribunalSelector(
                      selectedTribunal: selectedTribunal,
                      tribunais: tribunais,
                      onSelected: (String? value) {
                        setState(() {
                          selectedTribunal = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    FileUpload(onFilePicked: _pickFile),
                    const SizedBox(height: 20),
                    if (fileName != null) FileView(fileName: fileName!),
                    const SizedBox(height: 40),
                    AnalysisButton(isEnabled: isReadyForAnalysis, onPressed: _generateSummary),
                    const SizedBox(height: 40),
                    AnalysisResult(
                      summary: generatedSummary,
                      actions: recommendedActions,
                      fileName: fileName,
                      tribunal: selectedTribunal,
                    ),
                  ],
                ),
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
