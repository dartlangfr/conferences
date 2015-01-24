import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:appengine/appengine.dart';

import '../lib/entity.dart';

Future sendJSONResponse(HttpRequest request, json) {
  request.response
    ..headers.contentType = ContentType.JSON
    ..headers.set("Cache-Control", "no-cache")
    ..add(UTF8.encode(JSON.encode(json)));

  return request.response.close();
}

var persons = [
    new Person()..name = "John Lennon"..avatarUrl = "img/john.jpg"..dateOfBirth = new DateTime(1940, 10, 9),
    new Person()..name = "Paul McCartney"..avatarUrl = "img/paul.jpg"..dateOfBirth = new DateTime(1942, 6, 18),
    new Person()..name = "George Harrison"..avatarUrl = "img/george.jpg"..dateOfBirth = new DateTime(1943, 2, 25),
    new Person()..name = "Ringo Starr"..avatarUrl = "img/ringo.png"..dateOfBirth = new DateTime(1940, 7, 7)
];

main() {
  runAppEngine((HttpRequest request) {
    if (request.uri.path == '/items') {
      sendJSONResponse(request, persons.map(personToJson).toList());
    } else if (request.uri.path == '/') {
      request.response.redirect(Uri.parse('/index.html'));
    } else {
      context.assets.serve();
    }
  });
}
