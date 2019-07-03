import 'dart:async';
import 'dart:io';
import 'dart:isolate';

class TestThread extends Isolate {
  ReceivePort mainReceivePort;

  TestThread(ReceivePort recPort) : super(recPort.sendPort) {
    this.mainReceivePort = recPort;
  }

  void start() {
    final String msg = "Hola1";
    Timer.periodic(
        Duration(
          milliseconds: 1,
        ), (a) {
      controlPort.send(msg);
    });
  }
}
