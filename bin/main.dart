import 'dart:io';
import 'dart:isolate';

import 'TestThread.dart';

main(List<String> args) async {
  var receivePort = new ReceivePort();

  receivePort.listen((data) {
    sleep(Duration(milliseconds: 100));
    print("Received data: $data in Thread ${Isolate.current.debugName}");
  });

  TestThread thread = TestThread(receivePort);
  thread.start();
}
