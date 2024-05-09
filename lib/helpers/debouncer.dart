import 'dart:async';

class Debouncer<T> {
  Debouncer({
    required this.duration,
    required this.onValue,
  });
  final Duration duration;
  void Function(T value) onValue;
  T? _value;
  Timer? _timer;

  T? get value => _value;

  set value(T? value) {
    _value = value;
    _timer?.cancel();
    _timer = Timer(duration, () => onValue!(value!));
  }
}
