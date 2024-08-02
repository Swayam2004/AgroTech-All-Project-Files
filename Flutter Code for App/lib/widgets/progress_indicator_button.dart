import 'package:flutter/material.dart';

class BarProgressIndicator extends StatefulWidget {
  final int numberOfBars;
  final double fontSize;
  final double barSpacing;
  final Color color;
  final int milliseconds;
  final double beginTweenValue;
  final double endTweenValue;

  const BarProgressIndicator({
    super.key,
    this.numberOfBars = 3,
    this.fontSize = 10.0,
    this.color = Colors.black,
    this.barSpacing = 0.0,
    this.milliseconds = 250,
    this.beginTweenValue = 5.0,
    this.endTweenValue = 10.0,
  });

  @override
  State<BarProgressIndicator> createState() => _BarProgressIndicatorState();
}

class _BarProgressIndicatorState extends State<BarProgressIndicator>
    with TickerProviderStateMixin {
  late List<AnimationController> controllers;
  late List<Animation<double>> animations;
  late List<Widget> _widgets;

  @override
  void initState() {
    super.initState();
    controllers = [];
    animations = [];
    _widgets = [];
    for (int i = 0; i < widget.numberOfBars; i++) {
      _addAnimationControllers();
      _buildAnimations(i);
      _addListOfBars(i);
    }
    controllers[0].forward();
  }

  void _addAnimationControllers() {
    controllers.add(AnimationController(
        duration: Duration(milliseconds: widget.milliseconds), vsync: this));
  }

  void _buildAnimations(int index) {
    animations.add(
        Tween<double>(begin: widget.beginTweenValue, end: widget.endTweenValue)
            .animate(controllers[index])
          ..addStatusListener((AnimationStatus status) {
            if (status == AnimationStatus.completed) {
              controllers[index].reverse();
            }
            if (index == widget.numberOfBars - 1 &&
                status == AnimationStatus.dismissed) {
              controllers[0].forward();
            }
            if (animations[index].value > widget.endTweenValue / 2 &&
                index < widget.numberOfBars - 1) {
              controllers[index + 1].forward();
            }
          }));
  }

  void _addListOfBars(int index) {
    _widgets.add(Padding(
      padding: EdgeInsets.only(right: widget.barSpacing),
      child: _AnimatingBar(
        animation: animations[index],
        fontSize: widget.fontSize,
        color: widget.color,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: _widgets,
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}

class _AnimatingBar extends AnimatedWidget {
  final Color color;
  final double fontSize;

  const _AnimatingBar({
    required Animation<double> animation,
    required this.color,
    required this.fontSize,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Container(
      height: animation.value,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(2.0),
        color: color,
      ),
      width: fontSize,
    );
  }
}
