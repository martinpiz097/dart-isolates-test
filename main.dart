
import 'dart:isolate';

main(List<String> args) async {
  var receivePort = new ReceivePort();
  await Isolate.spawn(entryPoint, receivePort.sendPort);

  SendPort sendPort = await receivePort.first;
  sendPort.send("xd");

}

entryPoint(SendPort sendPort) async {
  var port = ReceivePort();

  sendPort.send(port.sendPort);

  await for (var data in port) {
    print("Data: ${data}");
  }
}