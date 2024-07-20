import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  final double delay; // Delay in seconds
  final Widget child;

  const FadeAnimation({required this.delay, required this.child});

  @override
  _FadeAnimationState createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _translateXAnimation;

  @override
  void initState() {
    super.initState();

    final int delayInMilliseconds = (widget.delay * 1000).round();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: delayInMilliseconds),
    );

    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _translateXAnimation =
        Tween<double>(begin: 120.0, end: 0.0).animate(_controller);
    _controller.forward(); // Start animation without additional delay
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Opacity(
        opacity: _opacityAnimation.value,
        child: Transform.translate(
          offset: Offset(_translateXAnimation.value, 0),
          child: child,
        ),
      ),
      child: widget.child,
    );
  }
}
