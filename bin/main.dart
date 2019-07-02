
import 'dart:isolate';

main(List<String> args) async {
  var receivePort = new ReceivePort();
  Isolate thread = await Isolate.spawn(threadTest, receivePort.sendPort);

  receivePort.listen((data){
    print("Data: $data in Thread ${Isolate.current.debugName}");
  });

}

threadTest(SendPort sendPort) async {
  var port = ReceivePort();
  sendPort.send("Message from ${Isolate.current.debugName}");

}