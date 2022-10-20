import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuiz;

  const Result(this.pontuacao, this.quandoReiniciarQuiz, {super.key});

  String? get fraseResultado {
    if (pontuacao < 10) {
      return 'Não foi dessa vez!';
    } else if (pontuacao < 20) {
      return 'Você conhece, hein!';
    } else if (pontuacao < 30) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: Text(
            textAlign: TextAlign.center,
            fraseResultado!,
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
          ),
        ),
        showWidget(),
        Padding(
          padding: const EdgeInsets.only(top: 80),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xff219ebc),
            ),
            onPressed: quandoReiniciarQuiz,
            child: const Text(
              'Reiniciar',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  showWidget() {
    if (pontuacao < 10) {
      return Text('Seu score: $pontuacao',
          style: const TextStyle(
              color: Color.fromARGB(255, 175, 76, 76), fontSize: 20));
    } else if (pontuacao < 20) {
      return Text('Seu score: $pontuacao',
          style: const TextStyle(
              color: Color.fromARGB(255, 212, 179, 71), fontSize: 20));
    } else if (pontuacao < 30) {
      return Text('Seu score: $pontuacao',
          style: const TextStyle(
              color: Color.fromARGB(255, 156, 211, 67), fontSize: 20));
    } else {
      return Text('Seu score: $pontuacao',
          style: const TextStyle(
              color: Color.fromARGB(255, 69, 231, 75), fontSize: 20));
    }
  }
}
