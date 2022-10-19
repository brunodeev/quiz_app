import './quiz.dart';
import 'package:app_perguntas/result.dart';
import 'package:flutter/material.dart';

main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Vermelho', 'nota': 10},
        {'texto': 'Amarelo', 'nota': 5},
        {'texto': 'Verde', 'nota': 3},
        {'texto': 'Azul', 'nota': 1},
      ],
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'respostas': [
        {'texto': 'Cobra', 'nota': 10},
        {'texto': 'Leão', 'nota': 5},
        {'texto': 'Elefante', 'nota': 3},
        {'texto': 'Dinossauro', 'nota': 1},
      ],
    },
    {
      'texto': 'Qual a melhor escola?',
      'respostas': [
        {'texto': 'Moraes', 'nota': 10},
        {'texto': 'CIEM', 'nota': 5},
        {'texto': 'Voo Livre', 'nota': 3},
        {'texto': 'Expressão', 'nota': 1},
      ],
    },
    {
      'texto': 'Qual a sua idade?',
      'respostas': [
        {'texto': '15', 'nota': 10},
        {'texto': '16', 'nota': 5},
        {'texto': '17', 'nota': 3},
        {'texto': '18', 'nota': 1},
      ],
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff219ebc),
          centerTitle: true,
          title: const Text('Quiz'),
        ),
        body: temPerguntaSelecionada
            ? Quiz(
                perguntaSelecionada: _perguntaSelecionada,
                perguntas: _perguntas,
                responder: _responder)
            : const Result(),
      ),
    );
  }
}
