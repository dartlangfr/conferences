import 'package:polymer/polymer.dart';
import '../lib/entity.dart';
import 'dart:html';
import 'dart:convert';

@CustomTag('post-card-list')
class PostCardList extends PolymerElement {
  @observable List<Person> persons = [];
  PostCardList.created() : super.created() {
    HttpRequest.getString("/items")
      .then(JSON.decode)
      .then((List jsonPersons) => persons = jsonPersons.map(personFromJson));
  }
}

