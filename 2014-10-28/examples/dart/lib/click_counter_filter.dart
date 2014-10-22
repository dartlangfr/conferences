import 'package:polymer/polymer.dart';

/**
 * A Polymer click counter element with a filter fonction.
 */
@CustomTag('click-counter-filter')
class ClickCounter extends PolymerElement {
  @observable int count = 0;

  ClickCounter.created() : super.created();

  increment() => count++;

  String stars(int count) => new List.filled(count, "★").join("");
}

