import 'package:polymer/polymer.dart';

@CustomTag('hello-world-template-repeat')
class HelloWorld extends PolymerElement {

  List<String> friends = ['John Doe', 'Jane Doe', 'Mister X'];

  HelloWorld.created() : super.created();

}