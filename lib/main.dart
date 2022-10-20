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
      'texto': 'Qual o melhor jogador do mundo atualmente?',
      'respostas': [
        {'texto': 'Messi', 'pontuacao': 0},
        {'texto': 'Cristiano Ronaldo', 'pontuacao': 0},
        {'texto': 'Benzema', 'pontuacao': 10},
        {'texto': 'Lewandowski', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual país sediará a Copa do Mundo?',
      'respostas': [
        {'texto': 'Brasil', 'pontuacao': 0},
        {'texto': 'Qatar', 'pontuacao': 10},
        {'texto': 'França', 'pontuacao': 0},
        {'texto': 'Inglaterra', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual seleção que mais vezes foi campeã da Copa?',
      'respostas': [
        {'texto': 'França', 'pontuacao': 0},
        {'texto': 'Itália', 'pontuacao': 0},
        {'texto': 'Alemanha', 'pontuacao': 0},
        {'texto': 'Brasil', 'pontuacao': 10},
      ],
    },
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
