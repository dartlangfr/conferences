import 'package:polymer/polymer.dart';

@CustomTag('hello-world-attribute')
class HelloWorld extends PolymerElement {
  @published String yourName;

  HelloWorld.created() : super.created();
}

