

import 'dart:isolate';

class TestThread extends Isolate {
  TestThread(SendPort controlPort) : super(controlPort);
  

}