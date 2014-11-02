import 'package:gcloud/datastore.dart';
import 'package:gcloud/db.dart';
import 'package:gcloud/common.dart';

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

  // TODO fix
  datastore.commit(inserts: persons).then((_){
    print('Data inserted');
  });

  //TODO
  var findQuery = new Query(kind: 'Person');
  datastore.query(findQuery).then((Page<Entity> page){
    print('Found ${page.items.length} items');
  });
}
