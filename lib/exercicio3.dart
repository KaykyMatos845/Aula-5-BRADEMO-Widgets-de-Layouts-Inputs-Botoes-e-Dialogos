import 'package:flutter/material.dart';

class Exercicio3 extends StatefulWidget {
  const Exercicio3({super.key});

  @override
  State<Exercicio3> createState() => _Exercicio3State();
}

class _Exercicio3State extends State<Exercicio3> {
  int _opcao = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercicio 3 - Layout Constraints'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue[50],
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8,
              children: [
                ElevatedButton(onPressed: () => setState(() => _opcao = 1), child: const Text('Exemplo 1')),
                ElevatedButton(onPressed: () => setState(() => _opcao = 2), child: const Text('Exemplo 2')),
                ElevatedButton(onPressed: () => setState(() => _opcao = 3), child: const Text('Exemplo 3')),
                ElevatedButton(onPressed: () => setState(() => _opcao = 4), child: const Text('Exemplo 4')),
                ElevatedButton(onPressed: () => setState(() => _opcao = 5), child: const Text('Exemplo 5')),
              ],
            ),
          ),
          
          Expanded(
            child: _construirExemplo(),
          ),

          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[200],
            width: double.infinity,
            child: Text(
              _obterExplicacao(),
              style: const TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }

  Widget _construirExemplo() {
    switch (_opcao) {
      case 1:
        return Container(
          color: Colors.red,
          width: 100,
          height: 100,
        );
      case 2:
        return Center(
          child: Container(
            color: Colors.red,
            width: 100,
            height: 100,
          ),
        );
      case 3:
        return Align(
          alignment: Alignment.bottomRight,
          child: Container(
            color: Colors.red,
            width: 100,
            height: 100,
          ),
        );
      case 4:
        return Center(
          child: Container(
            color: Colors.red,
          ),
        );
      case 5:
        return Center(
          child: Container(
            color: Colors.red,
            padding: const EdgeInsets.all(20),
            child: const Text('Flutter', style: TextStyle(color: Colors.white, fontSize: 30)),
          ),
        );
      default:
        return Container();
    }
  }

  String _obterExplicacao() {
    switch (_opcao) {
      case 1:
        return 'O Container preenche todo o espaço possível. O pai (Expanded) impõe constraints restritas dizendo "você deve ter esse tamanho exato". O width/height de 100 é ignorado!';
      case 2:
        return 'O widget Center relaxa as restrições forçadas pelo pai. Agora o Container pode seguir seu tamanho desejado de 100x100.';
      case 3:
        return 'O Align, assim como o Center, relaxa as constraints, e posiciona o filho no local especificado (bottomRight).';
      case 4:
        return 'Um Container sem restrições próprias e sem filhos tenta ser o maior possível, mas como não tem filhos, acaba virando "nada" em algumas situações. Tente ver se enxerga o vermelho (ele sumiu!).';
      case 5:
        return 'Quando tem filhos, o Container encolhe para abraçar os filhos (shrink-wrap). O texto define o tamanho final.';
      default:
        return '';
    }
  }
}
