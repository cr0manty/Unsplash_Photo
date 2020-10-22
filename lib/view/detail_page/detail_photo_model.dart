import 'dart:async';

class DetailPhotoModel {
  final StreamController<bool> _enabledCloseButtonStream = StreamController.broadcast();

  Timer _timer;
  Stream<bool> get enabledCloseButtonStream => _enabledCloseButtonStream.stream;

  DetailPhotoModel() {
    startTimer();
  }

  void startTimer() {
    _enabledCloseButtonStream.add(true);
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      _timer.cancel();
      _enabledCloseButtonStream.add(false);
    });
  }

  void dispose() {
    _enabledCloseButtonStream?.close();
  }
}