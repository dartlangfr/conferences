import 'dart:html';
import 'package:polymer/polymer.dart';

/**
 * A Polymer click counter element that fire count event.
 */
@CustomTag('click-counter-event-fire')
class ClickCounter extends PolymerElement {
  @observable int count = 0;

  ClickCounter.created() : super.created();

  bool increment() {
  	count++;
  	return dispatchEvent(new CustomEvent('count', detail: count));
  }
}
