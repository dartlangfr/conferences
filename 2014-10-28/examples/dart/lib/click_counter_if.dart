import 'package:polymer/polymer.dart';

/**
 * A Polymer click counter element.
 */
@CustomTag('click-counter-if')
class ClickCounter extends PolymerElement {
  @observable int count = 0;

  ClickCounter.created() : super.created();

  increment() => count++;
}

