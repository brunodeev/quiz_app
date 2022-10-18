import 'package:app_perguntas/answer_button.dart';
import 'package:app_perguntas/question.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function() responder;

  const Quiz({
    required this.perguntaSelecionada,
    required this.perguntas,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(
      children: [
        Question(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((text) => AnswerButton(text, responder)).toList(),
      ],
    );
  }
}
