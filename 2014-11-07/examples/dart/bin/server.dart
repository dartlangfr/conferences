import 'dart:io';
import 'package:appengine/appengine.dart';

void main() {
  runAppEngine((HttpRequest request) {
    request.response..write('Hello, world!')..close();
  }).then((_) {
    // Server running.
    context.services.logging.info("AppEngine started...");
  });
}
