import 'package:appengine/appengine.dart';

void main(){
  runAppEngine((requestHander) {
    requestHander.response
      ..write("Hello world")
      ..close();
  });
}
