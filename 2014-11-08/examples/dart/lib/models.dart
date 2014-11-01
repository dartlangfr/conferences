import 'package:gcloud/datastore.dart';
import 'package:gcloud/db.dart';

@Kind()
class Game extends Model {

  @StringProperty()
  String name;

  @StringProperty()
  String genre;

  @StringProperty()
  String description;

  @StringProperty()
  String image;

  @IntProperty()
  int rating;

  // CONSTRUCTORS
  Game(this.name, this.genre, this.description, this.image, this.rating);

  // Used for DEBUGGING
  String toString() => "Game{id: $id, name: $name}";

  // Used for FILTERING
  bool contains(String search) {
    var pattern = new RegExp(search, caseSensitive: false);
    return name.contains(pattern) || genre.contains(pattern) || description.contains(pattern);
  }

  // Used for SORTING
  static getComparator(String field) => _comparators.containsKey(field) ? _comparators[field] : (a, b) => 0;
  static final Map _comparators = {
      "name": (Game a, Game b) => a.name.compareTo(b.name),
      "rating": (Game a, Game b) => a.rating.compareTo(b.rating)
  };

  // Used for SERIALIZATION
  static fromMap(Map values) => new Game(values['name'], values['genre'], values['description'], values['image'], values['rating'])..id=values['id'];
  Map toMap() => {'id': id, 'name': name, 'genre': genre, 'description': description, 'image': image, 'rating': rating};
}
