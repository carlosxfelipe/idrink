import 'dart:async';
import 'package:flutter/material.dart';

class AnimatedGradientHeader extends StatefulWidget {
  const AnimatedGradientHeader({super.key});

  @override
  State<AnimatedGradientHeader> createState() => _AnimatedGradientHeaderState();
}

class _AnimatedGradientHeaderState extends State<AnimatedGradientHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Timer _timer;
  int _currentIndex = 0;
  double _opacity = 1.0;

  final List<String> _texts = [
    "Para você", // Português
    "For you", // Inglês
    "Para ti", // Espanhol
    "Per te", // Italiano
    "Pour toi", // Francês
    "Für dich", // Alemão
    "あなたのために", // Japonês
    "为你", // Chinês
    "당신을 위해", // Coreano
    "Για σένα", // Grego
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() => _opacity = 0.0);
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _texts.length;
          _opacity = 1.0;
        });
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final List<Color> gradientColors =
        isDarkMode
            ? [Colors.blue.shade700, Colors.tealAccent.shade700]
            : [Colors.purple.shade300, Colors.pinkAccent.shade200];

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Container(
            width: double.infinity,
            height: 55,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _opacity,
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      colors: gradientColors,
                      begin: Alignment(-1 + _controller.value, 0),
                      end: Alignment(_controller.value, 0),
                    ).createShader(bounds);
                  },
                  child: Text(
                    _texts[_currentIndex],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white, // Necessário para o ShaderMask
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
