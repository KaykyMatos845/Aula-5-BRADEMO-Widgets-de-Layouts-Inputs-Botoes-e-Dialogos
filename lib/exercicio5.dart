import 'package:flutter/material.dart';

class Exercicio5 extends StatefulWidget {
  const Exercicio5({super.key});

  @override
  State<Exercicio5> createState() => _Exercicio5State();
}

class _Exercicio5State extends State<Exercicio5> with SingleTickerProviderStateMixin {
  int _tab = 0;
  bool _open = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomAppBar with FAB'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Center(
            child: Text('TAB: $_tab', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          if (_open)
            GestureDetector(
              onTap: _toggle,
              child: Container(
                color: Colors.white60,
              ),
            ),
          IgnorePointer(
            ignoring: !_open,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildOption(Icons.message, 2),
                    _buildOption(Icons.email, 1),
                    _buildOption(Icons.phone, 0),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        onPressed: _toggle,
        shape: const CircleBorder(),
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 0.125).animate(_controller),
          child: const Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        height: 60,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTabItem(icon: Icons.menu, text: 'This', index: 0),
            _buildTabItem(icon: Icons.layers, text: 'Is', index: 1),
            const SizedBox(width: 48),
            _buildTabItem(icon: Icons.dashboard, text: 'Bottom', index: 2),
            _buildTabItem(icon: Icons.info, text: 'Bar', index: 3),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({required IconData icon, required String text, required int index}) {
    final isSelected = _tab == index;
    final color = isSelected ? Colors.blueAccent : Colors.grey;
    return InkWell(
      onTap: () {
        setState(() {
          _tab = index;
          if (_open) _toggle();
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Text(text, style: TextStyle(color: color, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildOption(IconData icon, int index) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _controller.value,
          child: Transform.translate(
            offset: Offset(0, 20.0 * (1 - _controller.value)),
            child: child,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: FloatingActionButton(
          heroTag: null,
          mini: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.blueAccent,
          onPressed: () {
            _toggle();
          },
          child: Icon(icon),
        ),
      ),
    );
  }
}
