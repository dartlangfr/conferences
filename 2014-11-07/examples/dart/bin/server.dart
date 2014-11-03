import 'package:appengine/appengine.dart';

void main(){
  final appContext = context;
  final logger = context.services.logging;
  runAppEngine((requestHander) {
    logger.info("AppEngine started...");
    requestHander.response
      ..write("Hello world")
      ..close();
  });
}
