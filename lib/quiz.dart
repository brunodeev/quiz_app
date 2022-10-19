import 'package:app_perguntas/answer_button.dart';
import 'package:app_perguntas/question.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function() responder;

  const Quiz({
    super.key,
    required this.perguntaSelecionada,
    required this.perguntas,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(
      children: [
        Question(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas
            .map((answer) => AnswerButton(answer['texto'] as String, responder))
            .toList(),
      ],
    );
  }
}
