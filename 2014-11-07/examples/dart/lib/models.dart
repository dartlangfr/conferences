import 'package:gcloud/datastore.dart';
import 'package:gcloud/db.dart';

@Kind()
class Person extends Model {
  @StringProperty(required: true)
  String name;

  @IntProperty()
  int age;

  @DateTimeProperty()
  DateTime dateOfBirth;
}


void runOperation(final Datastore datastore) {
  final List<Person> persons  = [
    new Person()..name = 'John Doe',
    new Person()..name = 'Jane Doe'
  ];

  //Entity

  datastore.commit(inserts: persons).then((_){
    print('Data inserted');
  });

  datastore.query()
}
