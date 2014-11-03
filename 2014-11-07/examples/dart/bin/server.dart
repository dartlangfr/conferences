import 'package:appengine/appengine.dart';

void main(){
  runAppEngine((requestHander) {
    context.services.logging.info("AppEngine started...");
    requestHander.response
      ..write("Hello world")
      ..close();
  });
}
