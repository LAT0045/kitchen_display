import 'dart:async';
import 'package:mobx/mobx.dart';

part 'time.g.dart';

class TimeStore = _TimeStore with _$TimeStore;

abstract class _TimeStore with Store {
  @observable
  DateTime currentTime = DateTime.now();

  late Timer _timer;

  _TimeStore() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => updateTime());
  }

  @action
  void updateTime() {
    currentTime = DateTime.now();
  }

  void startRealTimeUpdates() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => updateTime());
  }

  void stopRealTimeUpdates() {
    _timer.cancel();
  }
}
