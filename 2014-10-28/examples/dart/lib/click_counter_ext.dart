import "dart:html";
import 'package:polymer/polymer.dart';

/**
 * A Polymer click counter element that extends DOM.
 */
@CustomTag('click-counter-ext')
class ClickCounter extends ButtonElement with Polymer, Observable {
  @observable int count = 0;

  ClickCounter.created() : super.created() {
    polymerCreated();
  }

  increment() => count++;
}
