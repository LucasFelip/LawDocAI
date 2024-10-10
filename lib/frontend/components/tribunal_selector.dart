import 'package:flutter/material.dart';

class TribunalSelector extends StatelessWidget {
  final String? selectedTribunal;
  final List<String> tribunais;
  final Function(String?) onSelected;

  const TribunalSelector({
    super.key,
    required this.selectedTribunal,
    required this.tribunais,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Informe o Tribunal:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[100],
            border: Border.all(color: Colors.deepPurple, width: 2),
          ),
          child: DropdownButton<String>(
            value: selectedTribunal,
            hint: const Text('Escolha o Tribunal'),
            isExpanded: true,
            underline: const SizedBox(),
            items: tribunais.map((String tribunal) {
              return DropdownMenuItem<String>(
                value: tribunal,
                child: Text(tribunal),
              );
            }).toList(),
            onChanged: onSelected,
          ),
        ),
      ],
    );
  }
}
