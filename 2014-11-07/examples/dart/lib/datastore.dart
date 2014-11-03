import 'package:gcloud/datastore.dart';
import 'package:gcloud/db.dart' as db;
import 'package:gcloud/common.dart';

@db.Kind()
class Person extends db.Model {
  @db.StringProperty(required: true)
  String name;

  @db.IntProperty()
  int age;

  @db.DateTimeProperty()
  DateTime dateOfBirth;
}


void runOperations(final db.DatastoreDB datastoreDb) {
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
