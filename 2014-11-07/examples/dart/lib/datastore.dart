import 'package:gcloud/datastore.dart';
import 'package:gcloud/db.dart' hide Query;
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


void runOperations(final DatastoreDB datastoreDb) {
  final john = new Person()..name = 'John Doe';
  final jane = new Person()..name = 'Jane Doe';
  final List<Person> persons  = [john, jane];

  final List<Entity> entities = persons.map(datastoreDb.modelDB.toDatastoreEntity);

  datastoreDb.datastore.commit(inserts: entities).then((_){
    print('Data inserted');
  });

  final findQuery = new Query(ancestorKey: entities.first.key, kind: 'Adress');
  datastoreDb.datastore.query(findQuery).then((Page<Entity> page){
    print('Found ${page.items.length} items');
  });
}
