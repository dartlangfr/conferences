import 'dart:html';
import 'package:polymer/polymer.dart';

/**
 * A Polymer click counter element that fire count event.
 */
@CustomTag('click-counter-event-catch')
class ClickCounter extends PolymerElement {
  @observable int value = 0;

  ClickCounter.created() : super.created();

  hasCount(Event e, int count, Element target) => value = count;

}
