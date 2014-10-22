import 'package:polymer/polymer.dart';

@CustomTag('hello-world-binding')
class HelloWorld extends PolymerElement {
  @observable String yourName;

  HelloWorld.created() : super.created();
}

