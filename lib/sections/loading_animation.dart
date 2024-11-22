import 'package:flutter/material.dart';
import 'package:task_1/main.dart';

class StartingAnimation extends StatefulWidget {
  const StartingAnimation({super.key});

  @override
  State<StartingAnimation> createState() => _StartingAnimationState();
}

class _StartingAnimationState extends State<StartingAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          onEnd: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Screen1(),
              ),
            );
          },
          duration: const Duration(seconds: 1),
          tween: Tween<double>(begin: 0, end: 1000),
          builder: (context, size, _) {
            return Container(
              width: size,
              height: size,
              decoration: const BoxDecoration(
                color: Colors.amber,
              ),
            );
          },
        ),
      ),
    );
  }
}
