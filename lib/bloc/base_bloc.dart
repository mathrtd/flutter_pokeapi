import 'dart:async';

class BaseBloc {
  final StreamController _streamController = StreamController();
  Sink get input => _streamController.sink;
  Stream get output => _streamController.stream;
}
