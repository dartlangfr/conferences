import 'package:polymer/polymer.dart';
import 'package:intl/intl.dart';
import 'entity.dart';

@CustomTag('post-card')
class PostCard extends PolymerElement {
  @observable Person person = new Person()
    ..name = "John Lennon"
    ..avatarUrl = "img/avatar.jpg"
    ..dateOfBirth = new DateTime(1940, 10, 9);
  
  PostCard.created() : super.created();
  
  String dateToString(DateTime date) => new DateFormat.yMd().format(date);
}

