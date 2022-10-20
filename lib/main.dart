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
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Vermelho', 'pontuacao': 10},
        {'texto': 'Amarelo', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Azul', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'respostas': [
        {'texto': 'Cobra', 'pontuacao': 10},
        {'texto': 'Leão', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Dinossauro', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual a melhor escola?',
      'respostas': [
        {'texto': 'Moraes', 'pontuacao': 10},
        {'texto': 'CIEM', 'pontuacao': 5},
        {'texto': 'Voo Livre', 'pontuacao': 3},
        {'texto': 'Expressão', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual a sua idade?',
      'respostas': [
        {'texto': '15', 'pontuacao': 10},
        {'texto': '16', 'pontuacao': 5},
        {'texto': '17', 'pontuacao': 3},
        {'texto': '18', 'pontuacao': 1},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuiz() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

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
            : Result(_pontuacaoTotal, _reiniciarQuiz),
      ),
    );
  }
}
