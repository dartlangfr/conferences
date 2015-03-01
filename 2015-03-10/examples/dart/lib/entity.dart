library entity;

import 'package:gcloud/db.dart' hide Query;

@Kind()
class Person extends Model {
  @StringProperty(required: true)
  String name;

  @StringProperty()
  String avatarUrl;

  @DateTimeProperty()
  DateTime dateOfBirth;
}

personToJson(Person p) => {
  "name": p.name,
  "avatarUrl": p.avatarUrl,
  "dateOfBirth": p.dateOfBirth.toIso8601String()
};

personFromJson(Map m) => new Person()
  ..name = m["name"]
  ..avatarUrl = m["avatarUrl"]
  ..dateOfBirth = DateTime.parse(m["dateOfBirth"]);
