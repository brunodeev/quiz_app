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
      'respostas': ['Vermelho', 'Amarelo', 'Verde', 'Azul'],
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'respostas': ['Cobra', 'Leão', 'Elefante', 'Dinossauro'],
    },
    {
      'texto': 'Qual a sua escola?',
      'respostas': ['Moraes', 'CIEM', 'Voo Livre', 'Expressão'],
    },
    {
      'texto': 'Qual a sua idade?',
      'respostas': ['15', '16', '17', '18'],
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
