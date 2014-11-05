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