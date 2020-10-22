import 'dart:async';

import 'package:flutter/animation.dart';

class DetailPhotoModel {
  final state;
  AnimationController _animation;
  Animation<double> _fadeInFadeOut;
  Timer _timer;

  Animation<double> get fadeInFadeOut => _fadeInFadeOut;

  DetailPhotoModel(this.state) {
    _animation = AnimationController(
      vsync: state,
      duration: Duration(milliseconds: 300),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(_animation);
    _animation.forward();
    startTimer();
  }

  void startTimer() {
    _timer?.cancel();
    if (_animation.status == AnimationStatus.dismissed) {
      _animation.forward();

      _timer = Timer.periodic(Duration(seconds: 3), (timer) {
        _timer.cancel();

        _animation.reverse();
      });
    } else {
      _animation.reverse();
    }
  }

  void dispose() {
    _timer?.cancel();
  }
}
